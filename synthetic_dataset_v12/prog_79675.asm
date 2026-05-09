; DESCRIPTION: Places a orange line segment connecting (152, 55) to (420, 93).
; PLAN: r0=152(x1), r1=55(y1), r2=420(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 55
LDI r2, 420
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
