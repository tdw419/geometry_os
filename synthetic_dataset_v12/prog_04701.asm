; DESCRIPTION: Draws a green line from (236, 131) to (47, 250).
; PLAN: r0=236(x1), r1=131(y1), r2=47(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 131
LDI r2, 47
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
