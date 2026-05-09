; DESCRIPTION: Draws a green line from (13, 203) to (75, 11).
; PLAN: r0=13(x1), r1=203(y1), r2=75(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 203
LDI r2, 75
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
