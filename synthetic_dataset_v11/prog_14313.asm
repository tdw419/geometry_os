; DESCRIPTION: Places a red line segment connecting (254, 54) to (90, 222).
; PLAN: r0=254(x1), r1=54(y1), r2=90(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 54
LDI r2, 90
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
