; DESCRIPTION: Composite: Draws a cyan circle centered at (470, 200) with radius 40 then Sets a single red pixel at (384, 22) then Draws a orange rectangle at (230, 83) with width 110 and height 84.
; PLAN: r0=470(x), r1=200(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=22(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=83(y), r12=110(width), r13=84(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 200
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 22
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 230
LDI r11, 83
LDI r12, 110
LDI r13, 84
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
