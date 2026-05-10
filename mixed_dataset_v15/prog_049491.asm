; DESCRIPTION: Composite: Draws a yellow circle centered at (429, 214) with radius 39 then Draws a orange line from (269, 51) to (396, 140).
; PLAN: r0=429(x), r1=214(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x1), r6=51(y1), r7=396(x2), r8=140(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 214
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 51
LDI r7, 396
LDI r8, 140
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
