; DESCRIPTION: Places a red line segment connecting (244, 93) to (70, 31).
; PLAN: r0=244(x1), r1=93(y1), r2=70(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 93
LDI r2, 70
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
