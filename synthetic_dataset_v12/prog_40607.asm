; DESCRIPTION: Composite: Draws a purple rectangle at (296, 19) with width 49 and height 39 then Places a green dot at position (368, 129).
; PLAN: r0=296(x), r1=19(y), r2=49(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 19
LDI r2, 49
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
