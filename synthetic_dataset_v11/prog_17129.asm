; DESCRIPTION: Renders a black box of size 81x60 starting at (66, 31).
; PLAN: r0=66(x), r1=31(y), r2=81(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 31
LDI r2, 81
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
