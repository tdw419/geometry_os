; DESCRIPTION: Draws a green line from (174, 219) to (119, 212).
; PLAN: r0=174(x1), r1=219(y1), r2=119(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 219
LDI r2, 119
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
