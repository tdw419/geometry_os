; DESCRIPTION: Composite: Draws a yellow line from (366, 69) to (174, 21) then Sets a single yellow pixel at (191, 128).
; PLAN: r0=366(x1), r1=69(y1), r2=174(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=128(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 69
LDI r2, 174
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 128
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
