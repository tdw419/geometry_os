; DESCRIPTION: Composite: . Then Draws a purple rectangle at (61, 3) with width 54 and height 30. Then Places a black dot at position (184, 69).
; PLAN: r0=61(x), r1=3(y), r2=54(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=184(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (61, 3) with width 54 and height 30.
; PLAN: r0=61(x), r1=3(y), r2=54(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 3
LDI r2, 54
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (184, 69).
; PLAN: r0=184(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
HALT
