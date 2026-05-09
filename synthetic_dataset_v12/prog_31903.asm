; DESCRIPTION: Places a red line segment connecting (482, 150) to (91, 238).
; PLAN: r0=482(x1), r1=150(y1), r2=91(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 150
LDI r2, 91
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
