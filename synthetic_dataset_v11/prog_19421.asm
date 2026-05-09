; DESCRIPTION: Composite: . Then Draws a blue rectangle at (18, 45) with width 76 and height 42. Then Sets a single black pixel at (77, 51).
; PLAN: r0=18(x), r1=45(y), r2=76(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=77(x), r1=51(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (18, 45) with width 76 and height 42.
; PLAN: r0=18(x), r1=45(y), r2=76(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 45
LDI r2, 76
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (77, 51).
; PLAN: r0=77(x), r1=51(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 51
LDI r2, 0x000000
PSET r0, r1, r2
HALT
