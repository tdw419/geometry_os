; DESCRIPTION: Places a red line segment connecting (380, 16) to (8, 123).
; PLAN: r0=380(x1), r1=16(y1), r2=8(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 16
LDI r2, 8
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
