; DESCRIPTION: Renders a blue box of size 66x86 starting at (194, 49).
; PLAN: r0=194(x), r1=49(y), r2=66(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 49
LDI r2, 66
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
