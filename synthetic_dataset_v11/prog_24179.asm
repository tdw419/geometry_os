; DESCRIPTION: Renders a black box of size 64x34 starting at (144, 176).
; PLAN: r0=144(x), r1=176(y), r2=64(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 176
LDI r2, 64
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
