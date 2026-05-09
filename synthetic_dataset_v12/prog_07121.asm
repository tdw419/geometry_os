; DESCRIPTION: Composite: Places a white line segment connecting (458, 96) to (105, 45) then Places a purple 104x109 rectangle at position (244, 81).
; PLAN: r0=458(x1), r1=96(y1), r2=105(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=81(y), r7=104(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 96
LDI r2, 105
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 81
LDI r7, 104
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
