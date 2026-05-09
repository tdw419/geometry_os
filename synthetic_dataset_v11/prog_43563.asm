; DESCRIPTION: Composite: . Then Draws a black rectangle at (86, 148) with width 93 and height 62. Then Sets a single cyan pixel at (117, 219).
; PLAN: r0=86(x), r1=148(y), r2=93(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=117(x), r1=219(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (86, 148) with width 93 and height 62.
; PLAN: r0=86(x), r1=148(y), r2=93(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 148
LDI r2, 93
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (117, 219).
; PLAN: r0=117(x), r1=219(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 219
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
