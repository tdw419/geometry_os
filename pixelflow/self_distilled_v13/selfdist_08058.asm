; DESCRIPTION: Renders a orange line segment connecting (161, 173) to (160, 32).
; PLAN: r0=161(x1), r1=173(y1), r2=160(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 173
LDI r2, 160
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
