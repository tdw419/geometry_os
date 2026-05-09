; DESCRIPTION: Composite: Draws a white circle centered at (244, 220) with radius 28 then Renders a purple box of size 88x80 starting at (240, 20) then Places a orange dot at position (16, 85).
; PLAN: r0=244(x), r1=220(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=20(y), r7=88(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=16(x), r11=85(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 220
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 20
LDI r7, 88
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 85
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
