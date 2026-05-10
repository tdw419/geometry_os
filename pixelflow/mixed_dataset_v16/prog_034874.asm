; DESCRIPTION: Places a green line segment connecting (450, 220) to (302, 20).
; PLAN: r0=450(x1), r1=220(y1), r2=302(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 220
LDI r2, 302
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
