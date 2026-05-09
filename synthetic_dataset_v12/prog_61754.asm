; DESCRIPTION: Draws a green line from (203, 43) to (231, 237).
; PLAN: r0=203(x1), r1=43(y1), r2=231(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 43
LDI r2, 231
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
