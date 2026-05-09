; DESCRIPTION: Places a red line segment connecting (385, 52) to (65, 47).
; PLAN: r0=385(x1), r1=52(y1), r2=65(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 52
LDI r2, 65
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
