; DESCRIPTION: Composite: Draws a white line from (195, 15) to (338, 14) then Places a red 68x88 rectangle at position (314, 73).
; PLAN: r0=195(x1), r1=15(y1), r2=338(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=73(y), r7=68(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 15
LDI r2, 338
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 73
LDI r7, 68
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
