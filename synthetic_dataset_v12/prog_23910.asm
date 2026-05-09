; DESCRIPTION: Draws a yellow line from (26, 247) to (233, 196).
; PLAN: r0=26(x1), r1=247(y1), r2=233(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 247
LDI r2, 233
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
