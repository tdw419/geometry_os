; DESCRIPTION: Renders a white box of size 99x118 starting at (19, 15).
; PLAN: r0=19(x), r1=15(y), r2=99(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 15
LDI r2, 99
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
