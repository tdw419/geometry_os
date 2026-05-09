; DESCRIPTION: Places a green line segment connecting (506, 43) to (87, 65).
; PLAN: r0=506(x1), r1=43(y1), r2=87(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 43
LDI r2, 87
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
