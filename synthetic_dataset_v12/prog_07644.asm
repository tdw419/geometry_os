; DESCRIPTION: Composite: Draws a red rectangle at (467, 144) with width 18 and height 95 then Draws a white line from (202, 164) to (442, 14) then Draws a red circle centered at (77, 94) with radius 56.
; PLAN: r0=467(x), r1=144(y), r2=18(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x1), r6=164(y1), r7=442(x2), r8=14(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=94(y), r12=56(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 144
LDI r2, 18
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 164
LDI r7, 442
LDI r8, 14
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 94
LDI r12, 56
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
