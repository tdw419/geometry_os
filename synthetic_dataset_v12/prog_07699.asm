; DESCRIPTION: Composite: Creates a white circular shape at (117, 133) with radius 39 then Places a white line segment connecting (494, 198) to (358, 109).
; PLAN: r0=117(x), r1=133(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=198(y1), r7=358(x2), r8=109(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 133
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 198
LDI r7, 358
LDI r8, 109
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
