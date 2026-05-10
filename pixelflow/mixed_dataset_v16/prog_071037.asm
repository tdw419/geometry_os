; DESCRIPTION: Composite: Creates a white rectangular region at (220, 130) spanning 36 by 119 pixels then Places a blue dot at position (3, 248).
; PLAN: r0=220(x), r1=130(y), r2=36(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=248(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 130
LDI r2, 36
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 248
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
