; DESCRIPTION: Composite: . Then Places a cyan dot at position (50, 245). Then Draws a white rectangle at (183, 88) with width 24 and height 97.
; PLAN: r0=50(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=183(x), r1=88(y), r2=24(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (50, 245).
; PLAN: r0=50(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (183, 88) with width 24 and height 97.
; PLAN: r0=183(x), r1=88(y), r2=24(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 88
LDI r2, 24
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
