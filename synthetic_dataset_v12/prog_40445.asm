; DESCRIPTION: Places a red line segment connecting (256, 55) to (338, 162).
; PLAN: r0=256(x1), r1=55(y1), r2=338(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 55
LDI r2, 338
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
