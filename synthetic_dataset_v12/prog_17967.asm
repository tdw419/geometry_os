; DESCRIPTION: Composite: Places a magenta circle of radius 13 at center (362, 123) then Places a red dot at position (65, 1) then Places a orange line segment connecting (257, 2) to (348, 33).
; PLAN: r0=362(x), r1=123(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=257(x1), r11=2(y1), r12=348(x2), r13=33(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 123
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 257
LDI r11, 2
LDI r12, 348
LDI r13, 33
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
