; DESCRIPTION: Composite: Draws a orange line from (436, 123) to (162, 27) then Sets a single magenta pixel at (271, 191).
; PLAN: r0=436(x1), r1=123(y1), r2=162(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=191(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 123
LDI r2, 162
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 191
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
