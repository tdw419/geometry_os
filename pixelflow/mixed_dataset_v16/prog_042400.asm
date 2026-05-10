; DESCRIPTION: Draws a green line from (107, 84) to (149, 15).
; PLAN: r0=107(x1), r1=84(y1), r2=149(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 84
LDI r2, 149
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
