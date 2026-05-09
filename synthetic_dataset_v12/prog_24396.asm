; DESCRIPTION: Renders a orange line between points (21, 60) and (377, 150).
; PLAN: r0=21(x1), r1=60(y1), r2=377(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 60
LDI r2, 377
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
