; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (239, 100). Then Draws a black rectangle at (32, 115) with width 62 and height 94.
; PLAN: r0=239(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=32(x), r1=115(y), r2=62(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (239, 100).
; PLAN: r0=239(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (32, 115) with width 62 and height 94.
; PLAN: r0=32(x), r1=115(y), r2=62(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 115
LDI r2, 62
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
