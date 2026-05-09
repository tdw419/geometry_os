; DESCRIPTION: Renders a yellow line between points (399, 117) and (105, 46).
; PLAN: r0=399(x1), r1=117(y1), r2=105(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 117
LDI r2, 105
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
