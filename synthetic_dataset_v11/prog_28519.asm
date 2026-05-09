; DESCRIPTION: Places a green line segment connecting (159, 65) to (56, 50).
; PLAN: r0=159(x1), r1=65(y1), r2=56(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 65
LDI r2, 56
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
