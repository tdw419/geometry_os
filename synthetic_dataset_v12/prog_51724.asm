; DESCRIPTION: Draws a green line from (417, 13) to (225, 203).
; PLAN: r0=417(x1), r1=13(y1), r2=225(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 13
LDI r2, 225
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
