; DESCRIPTION: Places a red line segment connecting (182, 55) to (65, 110).
; PLAN: r0=182(x1), r1=55(y1), r2=65(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 55
LDI r2, 65
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
