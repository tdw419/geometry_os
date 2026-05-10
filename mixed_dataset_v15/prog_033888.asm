; DESCRIPTION: Draws a yellow line from (132, 183) to (60, 182).
; PLAN: r0=132(x1), r1=183(y1), r2=60(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 183
LDI r2, 60
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
