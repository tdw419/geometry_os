; DESCRIPTION: Places a green line segment connecting (241, 164) to (65, 212).
; PLAN: r0=241(x1), r1=164(y1), r2=65(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 164
LDI r2, 65
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
