; DESCRIPTION: Composite: Places a green dot at position (162, 200) then Draws a green rectangle at (183, 21) with width 91 and height 49 then Renders a green disk with center (271, 173) and radius 51.
; PLAN: r0=162(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=21(y), r7=91(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=271(x), r11=173(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 162
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 21
LDI r7, 91
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 173
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
