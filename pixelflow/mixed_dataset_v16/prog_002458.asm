; DESCRIPTION: Places a red line segment connecting (386, 25) to (395, 40).
; PLAN: r0=386(x1), r1=25(y1), r2=395(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 25
LDI r2, 395
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
