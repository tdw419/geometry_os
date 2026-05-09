; DESCRIPTION: Draws a green line from (248, 91) to (92, 145).
; PLAN: r0=248(x1), r1=91(y1), r2=92(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 91
LDI r2, 92
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
