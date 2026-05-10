; DESCRIPTION: Places a yellow line segment connecting (251, 222) to (283, 167).
; PLAN: r0=251(x1), r1=222(y1), r2=283(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 222
LDI r2, 283
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
