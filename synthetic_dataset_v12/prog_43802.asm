; DESCRIPTION: Draws a green line from (70, 163) to (250, 181).
; PLAN: r0=70(x1), r1=163(y1), r2=250(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 163
LDI r2, 250
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
