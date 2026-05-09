; DESCRIPTION: Renders a orange line between points (374, 53) and (60, 5).
; PLAN: r0=374(x1), r1=53(y1), r2=60(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 53
LDI r2, 60
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
