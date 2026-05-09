; DESCRIPTION: Places a green line segment connecting (302, 160) to (410, 97).
; PLAN: r0=302(x1), r1=160(y1), r2=410(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 160
LDI r2, 410
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
