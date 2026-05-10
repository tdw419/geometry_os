; DESCRIPTION: Composite: Draws a red circle centered at (445, 162) with radius 57 then Draws a purple rectangle at (439, 188) with width 30 and height 21.
; PLAN: r0=445(x), r1=162(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=188(y), r7=30(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 162
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 188
LDI r7, 30
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
