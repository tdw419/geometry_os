; DESCRIPTION: Draws a yellow line from (58, 208) to (506, 120).
; PLAN: r0=58(x1), r1=208(y1), r2=506(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 208
LDI r2, 506
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
