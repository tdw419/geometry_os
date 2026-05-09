; DESCRIPTION: Places a blue line segment connecting (60, 27) to (31, 20).
; PLAN: r0=60(x1), r1=27(y1), r2=31(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 27
LDI r2, 31
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
