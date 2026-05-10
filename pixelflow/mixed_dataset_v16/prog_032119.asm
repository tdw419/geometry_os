; DESCRIPTION: Composite: Draws a white circle centered at (122, 91) with radius 70 then Renders a purple box of size 60x21 starting at (74, 110) then Places a purple dot at position (240, 121).
; PLAN: r0=122(x), r1=91(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=110(y), r7=60(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=240(x), r11=121(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 91
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 110
LDI r7, 60
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 121
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
