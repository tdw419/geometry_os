; DESCRIPTION: Draws a green line from (45, 92) to (5, 199).
; PLAN: r0=45(x1), r1=92(y1), r2=5(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 92
LDI r2, 5
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
