; DESCRIPTION: Places a green line segment connecting (161, 185) to (15, 214).
; PLAN: r0=161(x1), r1=185(y1), r2=15(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 185
LDI r2, 15
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
