; DESCRIPTION: Renders a yellow line between points (2, 248) and (207, 7).
; PLAN: r0=2(x1), r1=248(y1), r2=207(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 248
LDI r2, 207
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
