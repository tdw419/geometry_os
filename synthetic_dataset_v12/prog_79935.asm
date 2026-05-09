; DESCRIPTION: Composite: Places a white line segment connecting (476, 109) to (167, 87) then Places a white 17x120 rectangle at position (76, 122).
; PLAN: r0=476(x1), r1=109(y1), r2=167(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=122(y), r7=17(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 109
LDI r2, 167
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 122
LDI r7, 17
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
