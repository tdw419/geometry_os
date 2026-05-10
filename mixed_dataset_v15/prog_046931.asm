; DESCRIPTION: Composite: Creates a white circular shape at (74, 36) with radius 30 then Places a white line segment connecting (61, 172) to (491, 234).
; PLAN: r0=74(x), r1=36(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x1), r6=172(y1), r7=491(x2), r8=234(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 36
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 172
LDI r7, 491
LDI r8, 234
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
