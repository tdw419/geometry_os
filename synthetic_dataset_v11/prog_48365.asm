; DESCRIPTION: Draws a black line from (255, 92) to (97, 104).
; PLAN: r0=255(x1), r1=92(y1), r2=97(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 92
LDI r2, 97
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
