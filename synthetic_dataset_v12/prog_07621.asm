; DESCRIPTION: Places a red line segment connecting (428, 38) to (438, 33).
; PLAN: r0=428(x1), r1=38(y1), r2=438(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 38
LDI r2, 438
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
