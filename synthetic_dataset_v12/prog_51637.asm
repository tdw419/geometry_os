; DESCRIPTION: Composite: Draws a yellow rectangle at (95, 92) with width 76 and height 80 then Places a black dot at position (108, 197).
; PLAN: r0=95(x), r1=92(y), r2=76(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=197(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 92
LDI r2, 76
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 197
LDI r7, 0x000000
PSET r5, r6, r7
HALT
