; DESCRIPTION: Places a red line segment connecting (313, 150) to (367, 252).
; PLAN: r0=313(x1), r1=150(y1), r2=367(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 150
LDI r2, 367
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
