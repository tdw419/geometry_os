; DESCRIPTION: Places a black line segment connecting (179, 67) to (410, 110).
; PLAN: r0=179(x1), r1=67(y1), r2=410(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 67
LDI r2, 410
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
