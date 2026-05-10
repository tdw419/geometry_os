; DESCRIPTION: Renders a black box of size 63x37 starting at (435, 1).
; PLAN: r0=435(x), r1=1(y), r2=63(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 1
LDI r2, 63
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
