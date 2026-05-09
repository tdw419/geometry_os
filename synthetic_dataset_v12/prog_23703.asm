; DESCRIPTION: Composite: Draws a blue rectangle at (437, 67) with width 62 and height 78 then Places a yellow dot at position (241, 60).
; PLAN: r0=437(x), r1=67(y), r2=62(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=60(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 67
LDI r2, 62
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 60
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
