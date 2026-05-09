; DESCRIPTION: Places a orange line segment connecting (317, 57) to (482, 38).
; PLAN: r0=317(x1), r1=57(y1), r2=482(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 57
LDI r2, 482
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
