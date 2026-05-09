; DESCRIPTION: Composite: Sets a single white pixel at (278, 192) then Draws a purple rectangle at (340, 71) with width 90 and height 70.
; PLAN: r0=278(x), r1=192(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=71(y), r7=90(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 192
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 71
LDI r7, 90
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
