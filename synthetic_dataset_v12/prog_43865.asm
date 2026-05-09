; DESCRIPTION: Composite: Draws a white circle centered at (381, 163) with radius 60 then Renders a magenta box of size 19x99 starting at (5, 113) then Places a purple dot at position (212, 52).
; PLAN: r0=381(x), r1=163(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=113(y), r7=19(width), r8=99(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x), r11=52(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 163
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 113
LDI r7, 19
LDI r8, 99
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 52
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
