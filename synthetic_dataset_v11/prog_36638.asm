; DESCRIPTION: Composite: . Then Sets a single green pixel at (74, 46). Then Draws a blue rectangle at (131, 13) with width 54 and height 39.
; PLAN: r0=74(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=131(x), r1=13(y), r2=54(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (74, 46).
; PLAN: r0=74(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (131, 13) with width 54 and height 39.
; PLAN: r0=131(x), r1=13(y), r2=54(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 13
LDI r2, 54
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
