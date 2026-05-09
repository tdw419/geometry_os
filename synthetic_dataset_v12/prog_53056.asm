; DESCRIPTION: Draws a green line from (477, 104) to (111, 90).
; PLAN: r0=477(x1), r1=104(y1), r2=111(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 104
LDI r2, 111
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
