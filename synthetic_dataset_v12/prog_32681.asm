; DESCRIPTION: Draws a green line from (433, 17) to (97, 203).
; PLAN: r0=433(x1), r1=17(y1), r2=97(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 17
LDI r2, 97
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
