; DESCRIPTION: Places a orange line segment connecting (138, 175) to (60, 164).
; PLAN: r0=138(x1), r1=175(y1), r2=60(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 175
LDI r2, 60
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
