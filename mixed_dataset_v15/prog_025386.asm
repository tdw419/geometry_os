; DESCRIPTION: Draws a green line from (136, 6) to (170, 203).
; PLAN: r0=136(x1), r1=6(y1), r2=170(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 6
LDI r2, 170
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
