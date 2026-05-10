; DESCRIPTION: Composite: Draws a red rectangle at (42, 149) with width 120 and height 20 then Places a black line segment connecting (148, 4) to (482, 111).
; PLAN: r0=42(x), r1=149(y), r2=120(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x1), r6=4(y1), r7=482(x2), r8=111(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 149
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 4
LDI r7, 482
LDI r8, 111
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
