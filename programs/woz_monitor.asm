; woz_monitor.asm — Native Memory Palace Monitor
;
; A minimal Woz-style monitor for Geometry OS.
; Displays a hex dump of RAM starting at 0x1000.
; Supports 'S' (Save) and 'L' (Load) to Host FS.
;
; Constants:
#define CMD_PUT      1
#define MAILBOX      0x7B00
#define MB_CMD       0
#define MB_CELL_X    1
#define MB_CELL_Y    2
#define MB_CHAR      3
#define STR_BUF      0x1000
#define STACK        0x7000

#define FILENAME_BUF 0x1100
#define INPUT_BUF    0x1120

; ASCII constants
#define CH_W  0x57
#define CH_o  0x6F
#define CH_z  0x7A
#define CH_0  0x30
#define CH_1  0x31
#define CH_S  0x53
#define CH_L  0x4C
#define CH_CR 0x0D
#define CH_COLON  0x3A
#define CH_F 0x46
#define CH_N 0x4E
#define STATUS_ROW 30

; --- Entry ---
    LDI r30, STACK

    ; Draw header
    LDI r2, 0
    LDI r3, 0
    LDI r11, STR_BUF
    LDI r1, CH_W
    STORE r11, r1
    ADDI r11, 1
    LDI r1, CH_o
    STORE r11, r1
    ADDI r11, 1
    LDI r1, CH_z
    STORE r11, r1
    ADDI r11, 1
    LDI r1, 0
    STORE r11, r1
    CALL render_string

main_loop:
    FRAME
    
    ; Display RAM at 0x1000 - 0x100F
    LDI r20, 0x1000
    LDI r3, 2
    
    LDI r2, 0
    CALL draw_addr
    LDI r2, 6
    CALL draw_hex_line

    ; Poll Keyboard
    IKEY r1
    CMPI r1, CH_S
    JZ r0, do_save
    CMPI r1, CH_L
    JZ r0, do_load

    JMP main_loop

do_save:
    CALL get_filename
    LDI r10, FILENAME_BUF
    LDI r11, 1
    FSOPEN r10, r11
    MOV r20, r0
    
    LDI r11, 0x1000
    LDI r12, 16
    FSWRITE r20, r11, r12
    FSCLOSE r20
    JMP main_loop
do_load:
    CALL get_filename
    LDI r10, FILENAME_BUF
    LDI r11, 0
    FSOPEN r10, r11
    MOV r20, r0
    
    LDI r11, 0x1000
    LDI r12, 16
    FSREAD r20, r11, r12
    FSCLOSE r20
    JMP main_loop

; --- Subroutines ---

; get_filename — prompt + echoed input to FILENAME_BUF
; Echoes each typed char to STATUS_ROW on the GlyphGrid
get_filename:
    LDI r10, FILENAME_BUF  ; buffer pointer

    ; Draw "FN: " prompt at (0, STATUS_ROW)
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    LDI r1, 0
    STORE r12, r1          ; x=0
    ADDI r12, 1
    LDI r1, STATUS_ROW
    STORE r12, r1          ; y=STATUS_ROW
    ADDI r12, 1
    LDI r1, CH_F
    STORE r12, r1          ; 'F'
    FRAME

    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    LDI r1, 1
    STORE r12, r1          ; x=1
    ADDI r12, 1
    LDI r1, STATUS_ROW
    STORE r12, r1
    ADDI r12, 1
    LDI r1, CH_N
    STORE r12, r1          ; 'N'
    FRAME

    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    LDI r1, 2
    STORE r12, r1          ; x=2
    ADDI r12, 1
    LDI r1, STATUS_ROW
    STORE r12, r1
    ADDI r12, 1
    LDI r1, CH_COLON
    STORE r12, r1          ; ':'
    FRAME

    LDI r5, 3              ; echo cursor x (col 3 after "FN:")
    LDI r3, STATUS_ROW

gf_loop:
    FRAME
    IKEY r1
    CMPI r1, 0
    JZ r0, gf_loop
    CMPI r1, CH_CR
    JZ r0, gf_done

    ; Echo char to GlyphGrid at (r5, STATUS_ROW)
    PUSH r10
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r5          ; x = echo cursor
    ADDI r12, 1
    STORE r12, r3          ; y = STATUS_ROW
    ADDI r12, 1
    STORE r12, r1          ; char
    FRAME
    POP r10

    ; Store to buffer
    STORE r10, r1
    ADDI r10, 1
    ADDI r5, 1             ; advance echo cursor
    JMP gf_loop

gf_done:
    ; Null-terminate buffer
    LDI r1, 0
    STORE r10, r1
    RET

render_string:
    MOV r5, r2
    MOV r6, r3
    LDI r10, STR_BUF
rs_loop:
    LOAD r1, r10
    CMPI r1, 0
    JZ r0, rs_done

    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r5
    ADDI r12, 1
    STORE r12, r6
    ADDI r12, 1
    STORE r12, r1
    FRAME

    ADDI r10, 1
    ADDI r5, 1
    JMP rs_loop
rs_done:
    RET

draw_addr:
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    LDI r1, CH_1
    STORE r12, r1
    FRAME
    
    ADDI r2, 1
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    LDI r1, CH_0
    STORE r12, r1
    FRAME

    ADDI r2, 1
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    STORE r12, r1
    FRAME
    
    ADDI r2, 1
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    STORE r12, r1
    FRAME
    
    ADDI r2, 1
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    LDI r1, CH_COLON
    STORE r12, r1
    FRAME
    
    RET

draw_hex_line:
    LDI r8, 8
dhl_loop:
    LOAD r1, r20
    
    MOV r5, r1
    LDI r4, 0xF
    AND r5, r4
    
    MOV r6, r1
    LDI r4, 4
    SHRI r6, 4
    
    CALL nibble_to_ascii
    MOV r7, r5
    MOV r5, r6
    CALL nibble_to_ascii
    
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    STORE r12, r5
    FRAME
    
    ADDI r2, 1
    LDI r12, MAILBOX
    LDI r4, CMD_PUT
    STORE r12, r4
    ADDI r12, 1
    STORE r12, r2
    ADDI r12, 1
    STORE r12, r3
    ADDI r12, 1
    STORE r12, r7
    FRAME
    
    SUBI r2, 1
    ADDI r2, 3
    ADDI r20, 1
    SUBI r8, 1
    JNZ r8, dhl_loop
    RET

nibble_to_ascii:
    CMPI r5, 10
    BLT r0, is_digit
    ADDI r5, 55
    RET
is_digit:
    ADDI r5, 48
    RET
