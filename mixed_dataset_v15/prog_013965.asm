; DESCRIPTION: Composite: Draws a purple rectangle at (127, 205) with width 48 and height 28 then Places a magenta dot at position (90, 69).
; PLAN: r0=127(x), r1=205(y), r2=48(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=69(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 205
LDI r2, 48
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 69
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
