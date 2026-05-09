; DESCRIPTION: Places a orange line segment connecting (0, 111) to (95, 69).
; PLAN: r0=0(x1), r1=111(y1), r2=95(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 111
LDI r2, 95
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
