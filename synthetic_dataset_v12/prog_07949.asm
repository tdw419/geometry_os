; DESCRIPTION: Composite: Draws a orange circle centered at (378, 130) with radius 54 then Renders a red box of size 99x74 starting at (76, 126) then Places a black dot at position (193, 127).
; PLAN: r0=378(x), r1=130(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=126(y), r7=99(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=127(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 130
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 126
LDI r7, 99
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 127
LDI r12, 0x000000
PSET r10, r11, r12
HALT
