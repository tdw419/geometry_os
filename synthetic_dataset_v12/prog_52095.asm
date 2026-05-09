; DESCRIPTION: Places a red line segment connecting (115, 13) to (288, 237).
; PLAN: r0=115(x1), r1=13(y1), r2=288(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 13
LDI r2, 288
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
