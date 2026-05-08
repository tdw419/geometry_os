; DESCRIPTION: Draw line: pos=the screen, color=red, size=fixed size.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r13, 0x000011
    FILL r13

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r6, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r2, 10             ; newline
    STORE r20, r2
    ADD r20, r6
    STRO r20, "Foo Bar"
    LDI r20, 0x601A        ; 0x600C + 1 + 7 + null = 0x600C+9 = 0x6015... hmm
    ; Let me just build the whole thing at once
    ; Actually STRO writes N chars + null. "Hello World" = 11 chars, writes to 0x6000-0x600A, null at 0x600B
    ; So after STRO, next write should be at 0x600C to overwrite the null with newline

    ; --- Redo: build text properly ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; null at 0x600B, replace with newline
    LDI r20, 0x600B
    LDI r2, 10             ; newline
    STORE r20, r2
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r2, 10
    STORE r20, r2
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r0, 0x6000        ; text pointer
    LDI r3, 0             ; char count
    LDI r7, 0             ; line count
    LDI r15, 0             ; word count
    LDI r9, 1             ; prev_was_space (start true)

count_loop:
    LOAD r2, r0           ; read char
    LDI r12, 0
    CMP r2, r12
    JZ r4, count_done

    ; char count++
    ADDI r3, 1

    ; Is it whitespace?
    LDI r12, 32
    CMP r2, r12
    JZ r4, is_space
    LDI r12, 10
    CMP r2, r12
    JZ r4, is_newline

    ; Non-whitespace: check if new word
    LDI r12, 1
    CMP r9, r12
    JNZ r4, not_new_word  ; if prev was NOT space, not a new word
    ADDI r15, 1            ; word count++
not_new_word:
    LDI r9, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r9, 1
    JMP next_char

is_newline:
    ADDI r7, 1            ; line count++
    LDI r9, 1
    JMP next_char

next_char:
    ADDI r0, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r11, 0x7800
    STORE r11, r3          ; chars

    LDI r11, 0x7801
    STORE r11, r7          ; lines

    LDI r11, 0x7802
    STORE r11, r15          ; words

    ; --- Draw header ---
    LDI r13, 0x660000
    LDI r10, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r10, r16, r17, r18, r13

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r0, 4
    LDI r3, 2
    LDI r7, 0x5000
    LDI r15, 0xFFFFFF
    LDI r9, 0x660000
    DRAWTEXT r0, r3, r7, r15, r9

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r0, 4
    LDI r3, 20
    LDI r7, 0x5000
    LDI r15, 0xCCCCCC
    LDI r9, 0x000011
    DRAWTEXT r0, r3, r7, r15, r9

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r0, 4
    LDI r3, 36
    LDI r7, 0x5000
    LDI r15, 0xCCCCCC
    LDI r9, 0x000011
    DRAWTEXT r0, r3, r7, r15, r9

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r0, 4
    LDI r3, 52
    LDI r7, 0x5000
    LDI r15, 0xCCCCCC
    LDI r9, 0x000011
    DRAWTEXT r0, r3, r7, r15, r9

    HALT
