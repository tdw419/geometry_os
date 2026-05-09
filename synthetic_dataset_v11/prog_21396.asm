; DESCRIPTION: Places a red line segment connecting (12, 230) to (185, 76).
; PLAN: r0=12(x1), r1=230(y1), r2=185(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 230
LDI r2, 185
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
