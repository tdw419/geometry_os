; PixelPack Seed: 0x789ABCDE (2023406814)
; Pattern=7, ColorA=0xFF8800, ColorB=0x8800FF
; Density=11, Offset=(188,222)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0xFF8800  ; Color A
LDI r11, 0x8800FF  ; Color B

; Pattern 7: Concentric rects
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 88
LDI r21, 88
LDI r22, 80
LDI r23, 80
RECTF r20, r21, r22, r23, r11

FRAME
HALT
