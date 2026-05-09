; DESCRIPTION: Places a red line segment connecting (269, 222) to (399, 225).
; PLAN: r0=269(x1), r1=222(y1), r2=399(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 222
LDI r2, 399
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
