; DESCRIPTION: Draws a green line from (159, 149) to (207, 252).
; PLAN: r0=159(x1), r1=149(y1), r2=207(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 149
LDI r2, 207
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
