; DESCRIPTION: Composite: Draws a yellow rectangle at (38, 86) with width 113 and height 39 then Places a blue dot at position (508, 246).
; PLAN: r0=38(x), r1=86(y), r2=113(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=246(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 86
LDI r2, 113
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 246
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
