; DESCRIPTION: Composite: Draws a purple circle centered at (367, 140) with radius 76 then Renders a purple box of size 20x76 starting at (391, 77) then Sets a single purple pixel at (482, 240).
; PLAN: r0=367(x), r1=140(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=77(y), r7=20(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=240(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 367
LDI r1, 140
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 77
LDI r7, 20
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 240
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
