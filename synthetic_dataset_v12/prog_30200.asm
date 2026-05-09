; DESCRIPTION: Composite: Creates a white circular shape at (356, 180) with radius 70 then Places a orange line segment connecting (191, 172) to (364, 109).
; PLAN: r0=356(x), r1=180(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=172(y1), r7=364(x2), r8=109(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 180
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 172
LDI r7, 364
LDI r8, 109
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
