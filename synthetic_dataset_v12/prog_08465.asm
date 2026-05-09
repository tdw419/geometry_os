; DESCRIPTION: Composite: Creates a white rectangular region at (386, 39) spanning 51 by 100 pixels then Renders a purple disk with center (319, 69) and radius 23 then Sets a single purple pixel at (447, 3).
; PLAN: r0=386(x), r1=39(y), r2=51(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=69(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x), r11=3(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 39
LDI r2, 51
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 69
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 3
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
