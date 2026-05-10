; DESCRIPTION: Composite: Draws a black rectangle at (31, 60) with width 98 and height 35 then Places a green line segment connecting (439, 169) to (338, 40).
; PLAN: r0=31(x), r1=60(y), r2=98(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=169(y1), r7=338(x2), r8=40(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 60
LDI r2, 98
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 169
LDI r7, 338
LDI r8, 40
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
