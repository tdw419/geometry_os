; DESCRIPTION: Composite: Places a yellow line segment connecting (353, 1) to (413, 80) then Draws a yellow rectangle at (253, 5) with width 66 and height 73.
; PLAN: r0=353(x1), r1=1(y1), r2=413(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=5(y), r7=66(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 1
LDI r2, 413
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 5
LDI r7, 66
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
