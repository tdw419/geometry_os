; DESCRIPTION: Places a cyan line segment connecting (4, 216) to (378, 253).
; PLAN: r0=4(x1), r1=216(y1), r2=378(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 216
LDI r2, 378
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
