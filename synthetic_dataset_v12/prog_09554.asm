; DESCRIPTION: Places a red line segment connecting (347, 5) to (445, 34).
; PLAN: r0=347(x1), r1=5(y1), r2=445(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 5
LDI r2, 445
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
