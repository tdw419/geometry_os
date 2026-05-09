; DESCRIPTION: Composite: . Then Draws a blue rectangle at (15, 98) with width 35 and height 108. Then Places a cyan dot at position (75, 176).
; PLAN: r0=15(x), r1=98(y), r2=35(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (15, 98) with width 35 and height 108.
; PLAN: r0=15(x), r1=98(y), r2=35(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 98
LDI r2, 35
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (75, 176).
; PLAN: r0=75(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
