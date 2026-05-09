; DESCRIPTION: Draws a green line from (83, 40) to (181, 60).
; PLAN: r0=83(x1), r1=40(y1), r2=181(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 40
LDI r2, 181
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
