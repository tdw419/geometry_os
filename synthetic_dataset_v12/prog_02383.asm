; DESCRIPTION: Composite: Sets a single purple pixel at (184, 13) then Draws a yellow rectangle at (28, 1) with width 70 and height 104.
; PLAN: r0=184(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=1(y), r7=70(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 28
LDI r6, 1
LDI r7, 70
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
