; DESCRIPTION: Composite: . Then Draws a green rectangle at (156, 209) with width 49 and height 27. Then Sets a single yellow pixel at (183, 194).
; PLAN: r0=156(x), r1=209(y), r2=49(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=183(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (156, 209) with width 49 and height 27.
; PLAN: r0=156(x), r1=209(y), r2=49(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 209
LDI r2, 49
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (183, 194).
; PLAN: r0=183(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
