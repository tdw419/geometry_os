; DESCRIPTION: Places a black line segment connecting (216, 39) to (99, 126).
; PLAN: r0=216(x1), r1=39(y1), r2=99(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 39
LDI r2, 99
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
