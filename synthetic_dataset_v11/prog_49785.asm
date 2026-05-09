; DESCRIPTION: Composite: . Then Sets a single purple pixel at (236, 88). Then Draws a black rectangle at (128, 67) with width 94 and height 86.
; PLAN: r0=236(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=67(y), r2=94(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (236, 88).
; PLAN: r0=236(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (128, 67) with width 94 and height 86.
; PLAN: r0=128(x), r1=67(y), r2=94(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 67
LDI r2, 94
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
