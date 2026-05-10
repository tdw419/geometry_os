; DESCRIPTION: Composite: Creates a white circular shape at (221, 95) with radius 77 then Places a orange line segment connecting (366, 100) to (422, 85).
; PLAN: r0=221(x), r1=95(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=100(y1), r7=422(x2), r8=85(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 95
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 100
LDI r7, 422
LDI r8, 85
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
