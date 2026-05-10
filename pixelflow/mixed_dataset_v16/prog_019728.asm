; DESCRIPTION: Draws a yellow line from (471, 240) to (290, 81).
; PLAN: r0=471(x1), r1=240(y1), r2=290(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 240
LDI r2, 290
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
