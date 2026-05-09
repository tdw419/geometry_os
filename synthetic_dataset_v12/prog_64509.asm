; DESCRIPTION: Composite: Draws a white circle centered at (401, 100) with radius 79 then Places a red line segment connecting (99, 45) to (391, 3).
; PLAN: r0=401(x), r1=100(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x1), r6=45(y1), r7=391(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 100
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 45
LDI r7, 391
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
