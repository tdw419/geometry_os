; DESCRIPTION: Places a black line segment connecting (469, 104) to (113, 255).
; PLAN: r0=469(x1), r1=104(y1), r2=113(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 104
LDI r2, 113
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
