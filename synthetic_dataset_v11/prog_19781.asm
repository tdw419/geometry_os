; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (146, 13). Then Draws a blue rectangle at (39, 78) with width 82 and height 114.
; PLAN: r0=146(x), r1=13(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=39(x), r1=78(y), r2=82(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (146, 13).
; PLAN: r0=146(x), r1=13(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 13
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (39, 78) with width 82 and height 114.
; PLAN: r0=39(x), r1=78(y), r2=82(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 78
LDI r2, 82
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
