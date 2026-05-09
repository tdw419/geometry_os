; DESCRIPTION: Composite: Draws a orange circle centered at (389, 135) with radius 40 then Places a orange line segment connecting (481, 131) to (45, 65).
; PLAN: r0=389(x), r1=135(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=131(y1), r7=45(x2), r8=65(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 135
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 131
LDI r7, 45
LDI r8, 65
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
