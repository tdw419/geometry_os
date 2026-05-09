; DESCRIPTION: Places a red line segment connecting (101, 220) to (248, 28).
; PLAN: r0=101(x1), r1=220(y1), r2=248(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 220
LDI r2, 248
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
