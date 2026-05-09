; DESCRIPTION: Places a red line segment connecting (3, 135) to (54, 223).
; PLAN: r0=3(x1), r1=135(y1), r2=54(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 135
LDI r2, 54
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
