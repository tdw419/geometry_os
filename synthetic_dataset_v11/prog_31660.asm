; DESCRIPTION: Renders a yellow box of size 15x114 starting at (33, 89).
; PLAN: r0=33(x), r1=89(y), r2=15(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 89
LDI r2, 15
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
