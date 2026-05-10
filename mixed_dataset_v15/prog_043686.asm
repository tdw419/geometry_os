; DESCRIPTION: Places a red line segment connecting (302, 59) to (170, 91).
; PLAN: r0=302(x1), r1=59(y1), r2=170(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 59
LDI r2, 170
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
