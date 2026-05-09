; DESCRIPTION: Composite: Renders a yellow box of size 106x95 starting at (19, 115) then Draws a orange circle centered at (210, 175) with radius 65 then Sets a single yellow pixel at (506, 82).
; PLAN: r0=19(x), r1=115(y), r2=106(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=175(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=506(x), r11=82(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 19
LDI r1, 115
LDI r2, 106
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 175
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 506
LDI r11, 82
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
