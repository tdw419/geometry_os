; DESCRIPTION: Composite: Draws a green rectangle at (25, 222) with width 47 and height 29 then Places a magenta dot at position (462, 197).
; PLAN: r0=25(x), r1=222(y), r2=47(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=197(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 222
LDI r2, 47
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 197
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
