; DESCRIPTION: Places a red line segment connecting (312, 207) to (406, 83).
; PLAN: r0=312(x1), r1=207(y1), r2=406(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 207
LDI r2, 406
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
