; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (6, 127) with width 10 and height 45. Then Sets a single green pixel at (78, 31).
; PLAN: r0=6(x), r1=127(y), r2=10(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=78(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (6, 127) with width 10 and height 45.
; PLAN: r0=6(x), r1=127(y), r2=10(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 127
LDI r2, 10
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (78, 31).
; PLAN: r0=78(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
