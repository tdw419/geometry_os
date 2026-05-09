; DESCRIPTION: Composite: . Then Places a red dot at position (30, 255). Then Draws a black rectangle at (29, 161) with width 26 and height 15.
; PLAN: r0=30(x), r1=255(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=29(x), r1=161(y), r2=26(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (30, 255).
; PLAN: r0=30(x), r1=255(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 255
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (29, 161) with width 26 and height 15.
; PLAN: r0=29(x), r1=161(y), r2=26(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 161
LDI r2, 26
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
