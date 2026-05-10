; DESCRIPTION: Composite: Draws a orange line from (20, 196) to (67, 187) then Sets a single yellow pixel at (433, 153).
; PLAN: r0=20(x1), r1=196(y1), r2=67(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=153(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 20
LDI r1, 196
LDI r2, 67
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 153
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
