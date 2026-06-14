; PixelPack Seed: 0x456789AB (1164413355)
; Pattern=4, ColorA=0xFF00FF, ColorB=0x00FFFF
; Density=8, Offset=(137,171)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0xFF00FF  ; Color A
LDI r11, 0x00FFFF  ; Color B

; Pattern 4: Border frame
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 8
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 248
LDI r22, 256
LDI r23, 8
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 0
LDI r22, 8
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 248
LDI r21, 0
LDI r22, 8
LDI r23, 256
RECTF r20, r21, r22, r23, r10

FRAME
HALT
