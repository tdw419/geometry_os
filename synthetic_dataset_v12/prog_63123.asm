; DESCRIPTION: Places a red line segment connecting (302, 149) to (482, 184).
; PLAN: r0=302(x1), r1=149(y1), r2=482(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 149
LDI r2, 482
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
