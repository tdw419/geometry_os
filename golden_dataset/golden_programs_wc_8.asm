; DESCRIPTION: Render a red line at the screen.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r11, 0x000011
    FILL r11

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r1, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r0, 10             ; newline
    STORE r20, r0
    ADD r20, r1
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
    LDI r0, 10             ; newline
    STORE r20, r0
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r0, 10
    STORE r20, r0
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r4, 0x6000        ; text pointer
    LDI r8, 0             ; char count
    LDI r3, 0             ; line count
    LDI r7, 0             ; word count
    LDI r10, 1             ; prev_was_space (start true)

count_loop:
    LOAD r0, r4           ; read char
    LDI r9, 0
    CMP r0, r9
    JZ r13, count_done

    ; char count++
    ADDI r8, 1

    ; Is it whitespace?
    LDI r9, 32
    CMP r0, r9
    JZ r13, is_space
    LDI r9, 10
    CMP r0, r9
    JZ r13, is_newline

    ; Non-whitespace: check if new word
    LDI r9, 1
    CMP r10, r9
    JNZ r13, not_new_word  ; if prev was NOT space, not a new word
    ADDI r7, 1            ; word count++
not_new_word:
    LDI r10, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r10, 1
    JMP next_char

is_newline:
    ADDI r3, 1            ; line count++
    LDI r10, 1
    JMP next_char

next_char:
    ADDI r4, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r2, 0x7800
    STORE r2, r8          ; chars

    LDI r2, 0x7801
    STORE r2, r3          ; lines

    LDI r2, 0x7802
    STORE r2, r7          ; words

    ; --- Draw header ---
    LDI r11, 0x660000
    LDI r5, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r5, r16, r17, r18, r11

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r4, 4
    LDI r8, 2
    LDI r3, 0x5000
    LDI r7, 0xFFFFFF
    LDI r10, 0x660000
    DRAWTEXT r4, r8, r3, r7, r10

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r4, 4
    LDI r8, 20
    LDI r3, 0x5000
    LDI r7, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r4, r8, r3, r7, r10

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r4, 4
    LDI r8, 36
    LDI r3, 0x5000
    LDI r7, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r4, r8, r3, r7, r10

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r4, 4
    LDI r8, 52
    LDI r3, 0x5000
    LDI r7, 0xCCCCCC
    LDI r10, 0x000011
    DRAWTEXT r4, r8, r3, r7, r10

    HALT
