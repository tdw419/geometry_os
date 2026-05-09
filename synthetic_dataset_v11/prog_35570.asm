; DESCRIPTION: Composite: . Then Sets a single green pixel at (248, 50). Then Draws a green rectangle at (2, 28) with width 104 and height 56.
; PLAN: r0=248(x), r1=50(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=2(x), r1=28(y), r2=104(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (248, 50).
; PLAN: r0=248(x), r1=50(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 50
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (2, 28) with width 104 and height 56.
; PLAN: r0=2(x), r1=28(y), r2=104(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 28
LDI r2, 104
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
