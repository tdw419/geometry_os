; DESCRIPTION: Composite: Places a purple line segment connecting (409, 162) to (22, 176) then Places a red dot at position (484, 6).
; PLAN: r0=409(x1), r1=162(y1), r2=22(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=6(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 162
LDI r2, 22
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 6
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
