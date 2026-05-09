; DESCRIPTION: Renders a green line between points (149, 160) and (275, 123).
; PLAN: r0=149(x1), r1=160(y1), r2=275(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 160
LDI r2, 275
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
