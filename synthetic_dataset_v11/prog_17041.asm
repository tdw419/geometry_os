; DESCRIPTION: Composite: . Then Draws a purple rectangle at (164, 14) with width 91 and height 88. Then Places a orange dot at position (151, 255).
; PLAN: r0=164(x), r1=14(y), r2=91(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (164, 14) with width 91 and height 88.
; PLAN: r0=164(x), r1=14(y), r2=91(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 14
LDI r2, 91
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (151, 255).
; PLAN: r0=151(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 255
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
