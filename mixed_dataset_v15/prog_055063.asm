; DESCRIPTION: Places a green line segment connecting (294, 185) to (166, 155).
; PLAN: r0=294(x1), r1=185(y1), r2=166(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 185
LDI r2, 166
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
