; DESCRIPTION: Renders a orange line between points (412, 95) and (400, 26).
; PLAN: r0=412(x1), r1=95(y1), r2=400(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 95
LDI r2, 400
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
