; DESCRIPTION: Draws a green line from (13, 4) to (185, 63).
; PLAN: r0=13(x1), r1=4(y1), r2=185(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 4
LDI r2, 185
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
