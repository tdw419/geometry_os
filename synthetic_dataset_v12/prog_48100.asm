; DESCRIPTION: Composite: Draws a purple rectangle at (353, 128) with width 40 and height 116 then Draws a white line from (2, 44) to (400, 5).
; PLAN: r0=353(x), r1=128(y), r2=40(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=44(y1), r7=400(x2), r8=5(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 128
LDI r2, 40
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 44
LDI r7, 400
LDI r8, 5
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
