; DESCRIPTION: Places a black line segment connecting (164, 104) to (207, 68).
; PLAN: r0=164(x1), r1=104(y1), r2=207(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 104
LDI r2, 207
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
