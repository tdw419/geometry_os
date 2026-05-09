; DESCRIPTION: Renders a yellow line between points (27, 234) and (6, 200).
; PLAN: r0=27(x1), r1=234(y1), r2=6(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 234
LDI r2, 6
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
