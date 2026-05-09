; DESCRIPTION: Renders a yellow line between points (14, 149) and (9, 91).
; PLAN: r0=14(x1), r1=149(y1), r2=9(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 149
LDI r2, 9
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
