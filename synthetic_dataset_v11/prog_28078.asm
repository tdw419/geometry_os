; DESCRIPTION: Places a red line segment connecting (219, 35) to (175, 234).
; PLAN: r0=219(x1), r1=35(y1), r2=175(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 35
LDI r2, 175
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
