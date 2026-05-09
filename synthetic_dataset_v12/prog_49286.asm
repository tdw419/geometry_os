; DESCRIPTION: Draws a cyan line from (66, 136) to (191, 203).
; PLAN: r0=66(x1), r1=136(y1), r2=191(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 136
LDI r2, 191
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
