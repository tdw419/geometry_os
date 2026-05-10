; DESCRIPTION: Composite: Renders a red box of size 82x46 starting at (410, 137) then Draws a red circle centered at (366, 123) with radius 39 then Sets a single white pixel at (97, 91).
; PLAN: r0=410(x), r1=137(y), r2=82(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=123(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=91(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 137
LDI r2, 82
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 123
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 91
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
