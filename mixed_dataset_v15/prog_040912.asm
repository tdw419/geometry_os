; DESCRIPTION: Composite: Draws a red rectangle at (255, 73) with width 17 and height 105 then Places a magenta dot at position (294, 207).
; PLAN: r0=255(x), r1=73(y), r2=17(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=207(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 73
LDI r2, 17
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 207
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
