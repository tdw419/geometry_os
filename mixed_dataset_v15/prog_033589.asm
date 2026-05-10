; DESCRIPTION: Draws a green line from (325, 15) to (76, 163).
; PLAN: r0=325(x1), r1=15(y1), r2=76(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 15
LDI r2, 76
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
