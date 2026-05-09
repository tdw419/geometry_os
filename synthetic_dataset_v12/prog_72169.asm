; DESCRIPTION: Composite: Draws a yellow line from (370, 60) to (204, 17) then Sets a single yellow pixel at (371, 67).
; PLAN: r0=370(x1), r1=60(y1), r2=204(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=67(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 60
LDI r2, 204
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 67
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
