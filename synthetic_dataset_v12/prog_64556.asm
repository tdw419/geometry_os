; DESCRIPTION: Draws a yellow line from (277, 78) to (35, 183).
; PLAN: r0=277(x1), r1=78(y1), r2=35(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 78
LDI r2, 35
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
