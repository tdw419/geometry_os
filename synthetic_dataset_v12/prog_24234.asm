; DESCRIPTION: Composite: Draws a cyan rectangle at (176, 166) with width 78 and height 68 then Places a purple dot at position (293, 72).
; PLAN: r0=176(x), r1=166(y), r2=78(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=72(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 176
LDI r1, 166
LDI r2, 78
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 72
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
