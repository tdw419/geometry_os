; PixelPack Seed: 0x56789ABC (1450744508)
; Pattern=5, ColorA=0x00FFFF, ColorB=0xFFFFFF
; Density=9, Offset=(154,188)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x00FFFF  ; Color A
LDI r11, 0xFFFFFF  ; Color B

; Pattern 5: Cross
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 145
LDI r21, 0
LDI r22, 18
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 179
LDI r22, 256
LDI r23, 18
RECTF r20, r21, r22, r23, r10

FRAME
HALT
