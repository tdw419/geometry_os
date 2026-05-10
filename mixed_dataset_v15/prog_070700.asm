; DESCRIPTION: Composite: Draws a blue rectangle at (176, 67) with width 84 and height 86 then Places a green dot at position (292, 90).
; PLAN: r0=176(x), r1=67(y), r2=84(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=90(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 176
LDI r1, 67
LDI r2, 84
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 90
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
