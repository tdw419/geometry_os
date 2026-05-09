; DESCRIPTION: Composite: Places a orange line segment connecting (213, 181) to (278, 50) then Sets a single white pixel at (108, 250).
; PLAN: r0=213(x1), r1=181(y1), r2=278(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=250(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 213
LDI r1, 181
LDI r2, 278
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 250
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
