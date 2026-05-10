; DESCRIPTION: Composite: Renders a black box of size 49x35 starting at (330, 90) then Draws a white circle centered at (182, 82) with radius 69 then Places a white dot at position (290, 205).
; PLAN: r0=330(x), r1=90(y), r2=49(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=82(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=205(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 90
LDI r2, 49
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 82
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 205
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
