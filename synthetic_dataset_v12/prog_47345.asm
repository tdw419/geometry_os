; DESCRIPTION: Places a red line segment connecting (188, 101) to (153, 107).
; PLAN: r0=188(x1), r1=101(y1), r2=153(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 101
LDI r2, 153
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
