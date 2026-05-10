; DESCRIPTION: Composite: Draws a black rectangle at (353, 3) with width 26 and height 43 then Places a blue dot at position (405, 124).
; PLAN: r0=353(x), r1=3(y), r2=26(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=124(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 3
LDI r2, 26
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 124
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
