; DESCRIPTION: Draws a green line from (217, 203) to (160, 176).
; PLAN: r0=217(x1), r1=203(y1), r2=160(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 203
LDI r2, 160
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
