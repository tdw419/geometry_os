; DESCRIPTION: Renders a orange line segment connecting (329, 124) to (48, 133).
; PLAN: r0=329(x1), r1=124(y1), r2=48(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 124
LDI r2, 48
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
