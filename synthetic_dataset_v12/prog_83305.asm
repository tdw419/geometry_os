; DESCRIPTION: Places a blue line segment connecting (498, 26) to (126, 170).
; PLAN: r0=498(x1), r1=26(y1), r2=126(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 26
LDI r2, 126
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
