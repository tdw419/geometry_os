; DESCRIPTION: Places a cyan line segment connecting (336, 162) to (490, 140).
; PLAN: r0=336(x1), r1=162(y1), r2=490(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 162
LDI r2, 490
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
