; DESCRIPTION: This GeOS assembly code searches for a byte pattern in a text buffer located at 0x6000, using a pre-loaded pattern at 0x6100. It counts the matches and displays them on the screen with highlighted text, storing the match count at RAM[0x7800].

; grep.asm -- Search for a pattern in RAM text
;
; Searches for all occurrences of a byte pattern in a text buffer.
; Pattern is pre-loaded at 0x6100, text at 0x6000.
; Outputs match count at RAM[0x7800].
; Displays matches on screen with highlighted text.
;
; Sample: search for "oo" in "Hello World\nFoo Bar\nBaz"
; Expected: 1 match (in "F[oo] Bar")

    ; --- Fill screen ---
    LDI r0, 0x000011
    FILL r0

    ; --- Pre-load text at 0x6000 ---
    LDI r20, 0x6000
    STRO r20, "Hello World"
    LDI r20, 0x600B
    LDI r5, 10
    STORE r20, r5
    LDI r20, 0x600C
    STRO r20, "Foo Bar"
    LDI r20, 0x6013
    LDI r5, 10
    STORE r20, r5
    LDI r20, 0x6014
    STRO r20, "Baz"

    ; --- Pre-load pattern at 0x6100 ---
    LDI r20, 0x6100
    STRO r20, "oo"

    ; --- Search ---
    LDI r11, 0x6000        ; text pointer
    LDI r1, 0             ; match count
    LDI r8, 1

search_loop:
    ; Read char at text pointer
    LOAD r5, r11
    ; Check for null (end of text)
    LDI r2, 0
    CMP r5, r2
    JZ r13, search_done

    ; Try to match pattern at this position
    LDI r6, 0x6100        ; pattern pointer
    MOV r16, r11            ; save start position

match_try:
    ; Read pattern char
    LOAD r5, r6
    ; If pattern char is null, full match
    LDI r2, 0
    CMP r5, r2
    JZ r13, found_match

    ; Read text char at current position
    LOAD r3, r16
    ; If text is null or newline, no match
    LDI r2, 0
    CMP r3, r2
    JZ r13, no_match

    ; Compare
    CMP r5, r3
    JNZ r13, no_match

    ; Match so far, advance both
    ADD r6, r8
    ADD r16, r8
    JMP match_try

found_match:
    ADDI r1, 1            ; match count++

no_match:
    ADDI r11, 1            ; advance text pointer
    JMP search_loop

search_done:
    ; Store match count
    LDI r14, 0x7800
    STORE r14, r1

    ; --- Draw header ---
    LDI r0, 0x006600       ; green header
    LDI r6, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 12
    RECTF r6, r16, r17, r18, r0

    LDI r20, 0x5000
    STRO r20, "grep:"
    LDI r11, 4
    LDI r1, 2
    LDI r10, 0x5000
    LDI r9, 0xFFFFFF
    LDI r7, 0x006600
    DRAWTEXT r11, r1, r10, r9, r7

    ; Show pattern searched
    LDI r20, 0x5000
    STRO r20, "Pattern:"
    LDI r11, 4
    LDI r1, 16
    LDI r10, 0x5000
    LDI r9, 0xCCCCCC
    LDI r7, 0x000011
    DRAWTEXT r11, r1, r10, r9, r7

    ; Show the pattern itself
    LDI r11, 80
    LDI r1, 16
    LDI r10, 0x6100
    LDI r9, 0xFFFF00     ; yellow
    LDI r7, 0x000011
    DRAWTEXT r11, r1, r10, r9, r7

    ; Show match count
    LDI r20, 0x5000
    STRO r20, "Matches:"
    LDI r11, 4
    LDI r1, 32
    LDI r10, 0x5000
    LDI r9, 0xCCCCCC
    LDI r7, 0x000011
    DRAWTEXT r11, r1, r10, r9, r7

    ; Show the original text
    LDI r20, 0x5000
    STRO r20, "Text:"
    LDI r11, 4
    LDI r1, 48
    LDI r10, 0x5000
    LDI r9, 0xCCCCCC
    LDI r7, 0x000011
    DRAWTEXT r11, r1, r10, r9, r7

    LDI r11, 50
    LDI r1, 48
    LDI r10, 0x6000
    LDI r9, 0x888888
    LDI r7, 0x000011
    DRAWTEXT r11, r1, r10, r9, r7

    HALT
