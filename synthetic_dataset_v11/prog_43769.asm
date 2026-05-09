; DESCRIPTION: Composite: . Then Draws a purple rectangle at (97, 11) with width 43 and height 33. Then Places a blue dot at position (5, 22).
; PLAN: r0=97(x), r1=11(y), r2=43(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=5(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (97, 11) with width 43 and height 33.
; PLAN: r0=97(x), r1=11(y), r2=43(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 11
LDI r2, 43
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (5, 22).
; PLAN: r0=5(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
