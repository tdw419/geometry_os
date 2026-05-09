; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (37, 74) with width 23 and height 67. Then Sets a single purple pixel at (62, 50).
; PLAN: r0=37(x), r1=74(y), r2=23(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=62(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (37, 74) with width 23 and height 67.
; PLAN: r0=37(x), r1=74(y), r2=23(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 74
LDI r2, 23
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (62, 50).
; PLAN: r0=62(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
