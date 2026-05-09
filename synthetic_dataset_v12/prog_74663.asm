; DESCRIPTION: Renders a yellow line between points (462, 67) and (343, 178).
; PLAN: r0=462(x1), r1=67(y1), r2=343(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 67
LDI r2, 343
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
