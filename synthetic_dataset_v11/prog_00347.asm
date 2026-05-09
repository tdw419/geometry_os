; DESCRIPTION: Places a red line segment connecting (54, 113) to (73, 244).
; PLAN: r0=54(x1), r1=113(y1), r2=73(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 113
LDI r2, 73
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
