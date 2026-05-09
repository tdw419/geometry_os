; DESCRIPTION: Composite: . Then Draws a black rectangle at (204, 32) with width 30 and height 49. Then Sets a single white pixel at (149, 252).
; PLAN: r0=204(x), r1=32(y), r2=30(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=149(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (204, 32) with width 30 and height 49.
; PLAN: r0=204(x), r1=32(y), r2=30(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 32
LDI r2, 30
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (149, 252).
; PLAN: r0=149(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
