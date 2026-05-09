; DESCRIPTION: Renders a yellow line between points (75, 102) and (465, 227).
; PLAN: r0=75(x1), r1=102(y1), r2=465(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 102
LDI r2, 465
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
