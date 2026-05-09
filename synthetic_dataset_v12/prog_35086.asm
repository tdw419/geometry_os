; DESCRIPTION: Places a green line segment connecting (43, 109) to (269, 122).
; PLAN: r0=43(x1), r1=109(y1), r2=269(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 109
LDI r2, 269
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
