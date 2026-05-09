; DESCRIPTION: Places a yellow line segment connecting (269, 180) to (270, 122).
; PLAN: r0=269(x1), r1=180(y1), r2=270(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 180
LDI r2, 270
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
