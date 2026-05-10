; DESCRIPTION: Draws a yellow line from (483, 244) to (346, 145).
; PLAN: r0=483(x1), r1=244(y1), r2=346(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 244
LDI r2, 346
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
