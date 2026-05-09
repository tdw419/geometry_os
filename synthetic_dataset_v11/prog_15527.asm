; DESCRIPTION: Places a yellow line segment connecting (87, 176) to (17, 199).
; PLAN: r0=87(x1), r1=176(y1), r2=17(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 17
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
