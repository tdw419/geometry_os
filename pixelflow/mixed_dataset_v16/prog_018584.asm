; DESCRIPTION: Composite: Sets a single cyan pixel at (504, 113) then Draws a red rectangle at (147, 0) with width 50 and height 61 then Draws a green circle centered at (151, 176) with radius 45.
; PLAN: r0=504(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=0(y), r7=50(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x), r11=176(y), r12=45(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 113
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 0
LDI r7, 50
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 176
LDI r12, 45
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
