; DESCRIPTION: Places a black line segment connecting (116, 220) to (104, 39).
; PLAN: r0=116(x1), r1=220(y1), r2=104(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 220
LDI r2, 104
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
