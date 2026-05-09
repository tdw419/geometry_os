; DESCRIPTION: Draws a yellow line from (180, 201) to (217, 148).
; PLAN: r0=180(x1), r1=201(y1), r2=217(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 201
LDI r2, 217
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
