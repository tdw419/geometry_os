; DESCRIPTION: Places a black line segment connecting (472, 25) to (450, 252).
; PLAN: r0=472(x1), r1=25(y1), r2=450(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 25
LDI r2, 450
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
