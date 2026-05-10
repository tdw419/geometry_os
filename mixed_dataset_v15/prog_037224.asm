; DESCRIPTION: Draws a yellow line from (506, 140) to (144, 138).
; PLAN: r0=506(x1), r1=140(y1), r2=144(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 140
LDI r2, 144
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
