; DESCRIPTION: Composite: Places a white dot at position (118, 115) then Draws a yellow rectangle at (395, 55) with width 36 and height 110 then Places a green circle of radius 27 at center (271, 107).
; PLAN: r0=118(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=55(y), r7=36(width), r8=110(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=271(x), r11=107(y), r12=27(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 395
LDI r6, 55
LDI r7, 36
LDI r8, 110
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 107
LDI r12, 27
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
