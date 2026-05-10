; DESCRIPTION: Composite: Draws a magenta rectangle at (249, 76) with width 28 and height 111 then Places a cyan dot at position (498, 131).
; PLAN: r0=249(x), r1=76(y), r2=28(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x), r6=131(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 76
LDI r2, 28
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 131
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
