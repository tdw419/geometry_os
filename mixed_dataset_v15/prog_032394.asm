; DESCRIPTION: Composite: Sets a single cyan pixel at (277, 168) then Draws a green rectangle at (54, 17) with width 100 and height 88 then Draws a green circle centered at (57, 31) with radius 18.
; PLAN: r0=277(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=17(y), r7=100(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x), r11=31(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 17
LDI r7, 100
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 31
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
