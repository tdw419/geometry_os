; DESCRIPTION: Places a red line segment connecting (219, 222) to (79, 127).
; PLAN: r0=219(x1), r1=222(y1), r2=79(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 222
LDI r2, 79
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
