; DESCRIPTION: Renders a orange line segment connecting (386, 119) to (273, 121).
; PLAN: r0=386(x1), r1=119(y1), r2=273(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 119
LDI r2, 273
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
