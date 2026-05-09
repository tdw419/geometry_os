; DESCRIPTION: Draws a green line from (19, 81) to (459, 72).
; PLAN: r0=19(x1), r1=81(y1), r2=459(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 81
LDI r2, 459
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
