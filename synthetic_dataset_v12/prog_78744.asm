; DESCRIPTION: Places a red line segment connecting (424, 68) to (243, 156).
; PLAN: r0=424(x1), r1=68(y1), r2=243(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 68
LDI r2, 243
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
