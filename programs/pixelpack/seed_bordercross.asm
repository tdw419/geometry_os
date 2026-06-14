; PixelPack Seed: 0xCDE12345 (3454083909)
; Pattern=12, ColorA=0x00FF88, ColorB=0x888888
; Density=2, Offset=(35,69)

; === Registers ===
LDI r10, 0   ; color A
LDI r11, 0   ; color B
LDI r20, 0   ; temp x
LDI r21, 0   ; temp y
LDI r22, 0   ; temp w
LDI r23, 0   ; temp h
LDI r30, 1   ; const 1

LDI r10, 0x00FF88  ; Color A
LDI r11, 0x888888  ; Color B

; Pattern 12: Border + Cross
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 256
RECTF r20, r21, r22, r23, r11
LDI r20, 0
LDI r21, 0
LDI r22, 256
LDI r23, 2
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 254
LDI r22, 256
LDI r23, 2
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 0
LDI r22, 2
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 254
LDI r21, 0
LDI r22, 2
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 126
LDI r21, 0
LDI r22, 4
LDI r23, 256
RECTF r20, r21, r22, r23, r10
LDI r20, 0
LDI r21, 126
LDI r22, 256
LDI r23, 4
RECTF r20, r21, r22, r23, r10

FRAME
HALT
