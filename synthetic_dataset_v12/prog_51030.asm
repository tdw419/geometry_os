; DESCRIPTION: Renders a green line between points (112, 9) and (55, 40).
; PLAN: r0=112(x1), r1=9(y1), r2=55(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 9
LDI r2, 55
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
