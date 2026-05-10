; DESCRIPTION: Composite: Draws a black rectangle at (377, 49) with width 19 and height 10 then Places a black dot at position (282, 103).
; PLAN: r0=377(x), r1=49(y), r2=19(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=103(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 49
LDI r2, 19
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 103
LDI r7, 0x000000
PSET r5, r6, r7
HALT
