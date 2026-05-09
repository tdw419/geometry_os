; DESCRIPTION: Renders a green box of size 51x114 starting at (109, 75).
; PLAN: r0=109(x), r1=75(y), r2=51(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 75
LDI r2, 51
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
