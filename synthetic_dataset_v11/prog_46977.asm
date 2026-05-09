; DESCRIPTION: Composite: . Then Draws a blue rectangle at (38, 160) with width 58 and height 52. Then Sets a single purple pixel at (144, 26).
; PLAN: r0=38(x), r1=160(y), r2=58(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (38, 160) with width 58 and height 52.
; PLAN: r0=38(x), r1=160(y), r2=58(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 160
LDI r2, 58
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (144, 26).
; PLAN: r0=144(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
