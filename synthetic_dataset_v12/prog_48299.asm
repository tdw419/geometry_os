; DESCRIPTION: Composite: Draws a white line from (72, 11) to (452, 200) then Draws a purple rectangle at (278, 16) with width 48 and height 73.
; PLAN: r0=72(x1), r1=11(y1), r2=452(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=16(y), r7=48(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 11
LDI r2, 452
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 16
LDI r7, 48
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
