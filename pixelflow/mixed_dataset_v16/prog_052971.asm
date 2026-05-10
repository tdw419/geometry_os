; DESCRIPTION: Composite: Sets a single magenta pixel at (480, 237) then Draws a magenta rectangle at (159, 201) with width 49 and height 40.
; PLAN: r0=480(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=201(y), r7=49(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 201
LDI r7, 49
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
