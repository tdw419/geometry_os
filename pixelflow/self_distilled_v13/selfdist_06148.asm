; DESCRIPTION: Renders a orange line segment connecting (371, 124) to (286, 60).
; PLAN: r0=371(x1), r1=124(y1), r2=286(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 124
LDI r2, 286
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
