; DESCRIPTION: Places a black line segment connecting (186, 43) to (431, 95).
; PLAN: r0=186(x1), r1=43(y1), r2=431(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 43
LDI r2, 431
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
