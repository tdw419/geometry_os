; DESCRIPTION: Places a orange line segment connecting (168, 44) to (35, 74).
; PLAN: r0=168(x1), r1=44(y1), r2=35(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 44
LDI r2, 35
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
