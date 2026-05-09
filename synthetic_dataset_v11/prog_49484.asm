; DESCRIPTION: Composite: . Then Places a purple dot at position (69, 28). Then Draws a purple rectangle at (121, 198) with width 82 and height 13.
; PLAN: r0=69(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=198(y), r2=82(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (69, 28).
; PLAN: r0=69(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple rectangle at (121, 198) with width 82 and height 13.
; PLAN: r0=121(x), r1=198(y), r2=82(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 198
LDI r2, 82
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
