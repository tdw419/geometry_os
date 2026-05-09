; DESCRIPTION: Draws a green line from (61, 102) to (253, 145).
; PLAN: r0=61(x1), r1=102(y1), r2=253(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 102
LDI r2, 253
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
