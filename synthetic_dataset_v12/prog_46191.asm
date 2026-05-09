; DESCRIPTION: Composite: Draws a green rectangle at (50, 20) with width 33 and height 94 then Places a orange dot at position (382, 124).
; PLAN: r0=50(x), r1=20(y), r2=33(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=124(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 20
LDI r2, 33
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 124
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
