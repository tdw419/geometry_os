; DESCRIPTION: Places a red line segment connecting (153, 16) to (46, 2).
; PLAN: r0=153(x1), r1=16(y1), r2=46(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 16
LDI r2, 46
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
