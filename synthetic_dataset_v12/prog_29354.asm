; DESCRIPTION: Composite: Draws a cyan rectangle at (292, 93) with width 36 and height 100 then Places a yellow line segment connecting (179, 36) to (69, 251) then Draws a white circle centered at (131, 189) with radius 36.
; PLAN: r0=292(x), r1=93(y), r2=36(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x1), r6=36(y1), r7=69(x2), r8=251(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=189(y), r12=36(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 93
LDI r2, 36
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 36
LDI r7, 69
LDI r8, 251
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 189
LDI r12, 36
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
