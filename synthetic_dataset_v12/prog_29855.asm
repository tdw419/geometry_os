; DESCRIPTION: Draws a yellow line from (457, 46) to (506, 221).
; PLAN: r0=457(x1), r1=46(y1), r2=506(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 46
LDI r2, 506
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
