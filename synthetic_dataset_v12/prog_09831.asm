; DESCRIPTION: Composite: Sets a single white pixel at (98, 57) then Places a red line segment connecting (267, 130) to (332, 85) then Draws a purple rectangle at (334, 55) with width 65 and height 99.
; PLAN: r0=98(x), r1=57(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=267(x1), r6=130(y1), r7=332(x2), r8=85(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=55(y), r12=65(width), r13=99(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 57
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 267
LDI r6, 130
LDI r7, 332
LDI r8, 85
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 55
LDI r12, 65
LDI r13, 99
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
