; DESCRIPTION: Places a yellow line segment connecting (470, 30) to (393, 93).
; PLAN: r0=470(x1), r1=30(y1), r2=393(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 30
LDI r2, 393
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
