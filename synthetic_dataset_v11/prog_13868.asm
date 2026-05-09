; DESCRIPTION: Places a orange line segment connecting (223, 222) to (127, 95).
; PLAN: r0=223(x1), r1=222(y1), r2=127(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 222
LDI r2, 127
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
