; DESCRIPTION: Places a magenta line segment connecting (191, 35) to (9, 139).
; PLAN: r0=191(x1), r1=35(y1), r2=9(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 35
LDI r2, 9
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
