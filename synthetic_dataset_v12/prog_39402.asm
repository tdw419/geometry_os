; DESCRIPTION: Renders a green box of size 34x30 starting at (427, 128).
; PLAN: r0=427(x), r1=128(y), r2=34(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 128
LDI r2, 34
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
