; DESCRIPTION: Composite: Draws a red circle centered at (235, 198) with radius 22 then Draws a white rectangle at (75, 73) with width 21 and height 120.
; PLAN: r0=235(x), r1=198(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=73(y), r7=21(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 198
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 73
LDI r7, 21
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
