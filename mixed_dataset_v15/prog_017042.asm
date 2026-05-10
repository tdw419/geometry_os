; DESCRIPTION: Draws a yellow line from (124, 138) to (55, 114).
; PLAN: r0=124(x1), r1=138(y1), r2=55(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 138
LDI r2, 55
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
