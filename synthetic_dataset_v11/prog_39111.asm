; DESCRIPTION: Places a red line segment connecting (207, 58) to (252, 237).
; PLAN: r0=207(x1), r1=58(y1), r2=252(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 58
LDI r2, 252
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
