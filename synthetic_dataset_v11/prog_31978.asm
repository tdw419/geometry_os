; DESCRIPTION: Places a red line segment connecting (27, 141) to (244, 16).
; PLAN: r0=27(x1), r1=141(y1), r2=244(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 141
LDI r2, 244
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
