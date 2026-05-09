; DESCRIPTION: Renders a black box of size 32x37 starting at (109, 15).
; PLAN: r0=109(x), r1=15(y), r2=32(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 15
LDI r2, 32
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
