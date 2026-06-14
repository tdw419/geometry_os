; CROSSHATCH -- Woven diagonal grid pattern
; Cyan lines going \  and magenta lines going /
; 16 lines total, evenly spaced across the 256x256 screen

; Color registers
LDI r20, 0x00DDDD      ; cyan-ish
LDI r21, 0xDD00DD      ; magenta-ish

; === Cyan diagonals (\ direction) ===
; Line from (0, i*32) to (i*32, 0) for i=0..7
; Line from (i*32, 255) to (255, 255-i*32) for i=1..7

; Group 1: top-left to mid-right, going down-left
; (0, 0) to (255, 255) - main diagonal
LDI r0, 0
LDI r1, 0
LDI r2, 255
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (32, 0) to (255, 223)
LDI r0, 32
LDI r1, 0
LDI r2, 255
LDI r3, 223
LINE r0, r1, r2, r3, r20

; (64, 0) to (255, 191)
LDI r0, 64
LDI r1, 0
LDI r2, 255
LDI r3, 191
LINE r0, r1, r2, r3, r20

; (96, 0) to (255, 159)
LDI r0, 96
LDI r1, 0
LDI r2, 255
LDI r3, 159
LINE r0, r1, r2, r3, r20

; (128, 0) to (255, 127)
LDI r0, 128
LDI r1, 0
LDI r2, 255
LDI r3, 127
LINE r0, r1, r2, r3, r20

; (160, 0) to (255, 95)
LDI r0, 160
LDI r1, 0
LDI r2, 255
LDI r3, 95
LINE r0, r1, r2, r3, r20

; (192, 0) to (255, 63)
LDI r0, 192
LDI r1, 0
LDI r2, 255
LDI r3, 63
LINE r0, r1, r2, r3, r20

; (224, 0) to (255, 31)
LDI r0, 224
LDI r1, 0
LDI r2, 255
LDI r3, 31
LINE r0, r1, r2, r3, r20

; === Magenta diagonals (/ direction) ===
; (0, 0) to (255, 255) anti-diagonal... wait, / is (0,255) to (255,0)
; (0, 255) to (255, 0)
LDI r0, 0
LDI r1, 255
LDI r2, 255
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 223) to (223, 0)
LDI r0, 0
LDI r1, 223
LDI r2, 223
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 191) to (191, 0)
LDI r0, 0
LDI r1, 191
LDI r2, 191
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 159) to (159, 0)
LDI r0, 0
LDI r1, 159
LDI r2, 159
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 127) to (127, 0)
LDI r0, 0
LDI r1, 127
LDI r2, 127
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 95) to (95, 0)
LDI r0, 0
LDI r1, 95
LDI r2, 95
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 63) to (63, 0)
LDI r0, 0
LDI r1, 63
LDI r2, 63
LDI r3, 0
LINE r0, r1, r2, r3, r21

; (0, 31) to (31, 0)
LDI r0, 0
LDI r1, 31
LDI r2, 31
LDI r3, 0
LINE r0, r1, r2, r3, r21

; === Also add offset cyan lines for full coverage ===
; (0, 32) to (223, 255)
LDI r0, 0
LDI r1, 32
LDI r2, 223
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (0, 64) to (191, 255)
LDI r0, 0
LDI r1, 64
LDI r2, 191
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (0, 96) to (159, 255)
LDI r0, 0
LDI r1, 96
LDI r2, 159
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (0, 128) to (127, 255)
LDI r0, 0
LDI r1, 128
LDI r2, 127
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (0, 160) to (95, 255)
LDI r0, 0
LDI r1, 160
LDI r2, 95
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (0, 192) to (63, 255)
LDI r0, 0
LDI r1, 192
LDI r2, 63
LDI r3, 255
LINE r0, r1, r2, r3, r20

; (0, 224) to (31, 255)
LDI r0, 0
LDI r1, 224
LDI r2, 31
LDI r3, 255
LINE r0, r1, r2, r3, r20

; === Offset magenta lines ===
; (32, 255) to (255, 32)
LDI r0, 32
LDI r1, 255
LDI r2, 255
LDI r3, 32
LINE r0, r1, r2, r3, r21

; (64, 255) to (255, 64)
LDI r0, 64
LDI r1, 255
LDI r2, 255
LDI r3, 64
LINE r0, r1, r2, r3, r21

; (96, 255) to (255, 96)
LDI r0, 96
LDI r1, 255
LDI r2, 255
LDI r3, 96
LINE r0, r1, r2, r3, r21

; (128, 255) to (255, 128)
LDI r0, 128
LDI r1, 255
LDI r2, 255
LDI r3, 128
LINE r0, r1, r2, r3, r21

; (160, 255) to (255, 160)
LDI r0, 160
LDI r1, 255
LDI r2, 255
LDI r3, 160
LINE r0, r1, r2, r3, r21

; (192, 255) to (255, 192)
LDI r0, 192
LDI r1, 255
LDI r2, 255
LDI r3, 192
LINE r0, r1, r2, r3, r21

; (224, 255) to (255, 224)
LDI r0, 224
LDI r1, 255
LDI r2, 255
LDI r3, 224
LINE r0, r1, r2, r3, r21

HALT
