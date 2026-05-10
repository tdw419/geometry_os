; DESCRIPTION: Composite: Sets a single red pixel at (284, 153) then Draws a orange circle centered at (421, 158) with radius 67.
; PLAN: r0=284(x), r1=153(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=158(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 153
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 421
LDI r6, 158
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
