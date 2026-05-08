; DESCRIPTION: A red line centered at the screen with fixed size.

; wc.asm -- Word count utility
;
; Counts characters, lines, and words in a text buffer stored in RAM.
; Text is pre-loaded at 0x6000 using STRO.
; Results stored at RAM[0x7800] (chars), RAM[0x7801] (lines), RAM[0x7802] (words).
;
; Sample text: "Hello World\nFoo Bar\nBaz" = 23 chars, 2 lines, 5 words

    ; --- Fill screen ---
    LDI r10, 0x000011
    FILL r10

    ; --- Pre-load sample text at 0x6000 ---
    ; We write char by char to have full control
    ; "Hello World\nFoo Bar\nBaz\0"
    LDI r20, 0x6000
    STRO r20, "Hello World"
    ; r20 is still 0x6000, STRO doesn't advance r20
    ; We need to manually advance
    LDI r6, 1
    LDI r20, 0x600C        ; after "Hello World" + null = 0x6000+12
    LDI r4, 10             ; newline
    STORE r20, r4
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
    LDI r4, 10             ; newline
    STORE r20, r4
    ; continue at 0x600C
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    ; null at 0x6013, replace with newline
    LDI r20, 0x6013
    LDI r4, 10
    STORE r20, r4
    ; continue at 0x6014
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Count characters, lines, words ---
    LDI r2, 0x6000        ; text pointer
    LDI r15, 0             ; char count
    LDI r1, 0             ; line count
    LDI r5, 0             ; word count
    LDI r3, 1             ; prev_was_space (start true)

count_loop:
    LOAD r4, r2           ; read char
    LDI r0, 0
    CMP r4, r0
    JZ r13, count_done

    ; char count++
    ADDI r15, 1

    ; Is it whitespace?
    LDI r0, 32
    CMP r4, r0
    JZ r13, is_space
    LDI r0, 10
    CMP r4, r0
    JZ r13, is_newline

    ; Non-whitespace: check if new word
    LDI r0, 1
    CMP r3, r0
    JNZ r13, not_new_word  ; if prev was NOT space, not a new word
    ADDI r5, 1            ; word count++
not_new_word:
    LDI r3, 0             ; prev_was_space = 0
    JMP next_char

is_space:
    LDI r3, 1
    JMP next_char

is_newline:
    ADDI r1, 1            ; line count++
    LDI r3, 1
    JMP next_char

next_char:
    ADDI r2, 1
    JMP count_loop

count_done:
    ; Store results
    LDI r14, 0x7800
    STORE r14, r15          ; chars

    LDI r14, 0x7801
    STORE r14, r1          ; lines

    LDI r14, 0x7802
    STORE r14, r5          ; words

    ; --- Draw header ---
    LDI r10, 0x660000
    LDI r8, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r8, r16, r17, r18, r10

    LDI r20, 0x5000
    STRO r20, "Word Count"
    LDI r2, 4
    LDI r15, 2
    LDI r1, 0x5000
    LDI r5, 0xFFFFFF
    LDI r3, 0x660000
    DRAWTEXT r2, r15, r1, r5, r3

    ; Display labels
    LDI r20, 0x5000
    STRO r20, "Chars:"
    LDI r2, 4
    LDI r15, 20
    LDI r1, 0x5000
    LDI r5, 0xCCCCCC
    LDI r3, 0x000011
    DRAWTEXT r2, r15, r1, r5, r3

    LDI r20, 0x5000
    STRO r20, "Lines:"
    LDI r2, 4
    LDI r15, 36
    LDI r1, 0x5000
    LDI r5, 0xCCCCCC
    LDI r3, 0x000011
    DRAWTEXT r2, r15, r1, r5, r3

    LDI r20, 0x5000
    STRO r20, "Words:"
    LDI r2, 4
    LDI r15, 52
    LDI r1, 0x5000
    LDI r5, 0xCCCCCC
    LDI r3, 0x000011
    DRAWTEXT r2, r15, r1, r5, r3

    HALT
