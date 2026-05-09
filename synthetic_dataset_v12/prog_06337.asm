; DESCRIPTION: Draws a green line from (36, 132) to (497, 92).
; PLAN: r0=36(x1), r1=132(y1), r2=497(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 132
LDI r2, 497
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
