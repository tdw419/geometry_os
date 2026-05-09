; DESCRIPTION: Places a red line segment connecting (143, 25) to (22, 178).
; PLAN: r0=143(x1), r1=25(y1), r2=22(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 25
LDI r2, 22
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
