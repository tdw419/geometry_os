; DESCRIPTION: Composite: . Then Sets a single green pixel at (88, 103). Then Draws a cyan rectangle at (96, 46) with width 11 and height 20.
; PLAN: r0=88(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=46(y), r2=11(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (88, 103).
; PLAN: r0=88(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (96, 46) with width 11 and height 20.
; PLAN: r0=96(x), r1=46(y), r2=11(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 46
LDI r2, 11
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
