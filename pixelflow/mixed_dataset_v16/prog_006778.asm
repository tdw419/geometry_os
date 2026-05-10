; DESCRIPTION: Composite: Draws a purple circle centered at (240, 116) with radius 44 then Renders a purple box of size 39x105 starting at (386, 11) then Sets a single white pixel at (324, 229).
; PLAN: r0=240(x), r1=116(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=11(y), r7=39(width), r8=105(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x), r11=229(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 116
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 11
LDI r7, 39
LDI r8, 105
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 229
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
