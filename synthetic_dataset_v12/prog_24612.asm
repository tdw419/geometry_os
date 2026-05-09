; DESCRIPTION: Places a red line segment connecting (244, 205) to (10, 55).
; PLAN: r0=244(x1), r1=205(y1), r2=10(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 205
LDI r2, 10
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
