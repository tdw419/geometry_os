; DESCRIPTION: Draws a blue line from (391, 160) to (61, 40).
; PLAN: r0=391(x1), r1=160(y1), r2=61(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 160
LDI r2, 61
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
