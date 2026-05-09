; DESCRIPTION: Draws a yellow line from (274, 146) to (14, 17).
; PLAN: r0=274(x1), r1=146(y1), r2=14(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 146
LDI r2, 14
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
