; DESCRIPTION: Composite: . Then Draws a purple rectangle at (51, 198) with width 59 and height 31. Then Places a black dot at position (19, 181).
; PLAN: r0=51(x), r1=198(y), r2=59(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=19(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (51, 198) with width 59 and height 31.
; PLAN: r0=51(x), r1=198(y), r2=59(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 198
LDI r2, 59
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (19, 181).
; PLAN: r0=19(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
HALT
