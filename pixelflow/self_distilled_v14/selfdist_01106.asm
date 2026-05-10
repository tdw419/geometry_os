; DESCRIPTION: Renders a orange line segment connecting (317, 96) to (329, 76).
; PLAN: r0=317(x1), r1=96(y1), r2=329(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 96
LDI r2, 329
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
