; DESCRIPTION: Places a orange line segment connecting (124, 138) to (48, 226).
; PLAN: r0=124(x1), r1=138(y1), r2=48(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 138
LDI r2, 48
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
