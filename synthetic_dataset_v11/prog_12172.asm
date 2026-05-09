; DESCRIPTION: Composite: . Then Sets a single orange pixel at (17, 138). Then Draws a white rectangle at (17, 77) with width 86 and height 103.
; PLAN: r0=17(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=17(x), r1=77(y), r2=86(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (17, 138).
; PLAN: r0=17(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (17, 77) with width 86 and height 103.
; PLAN: r0=17(x), r1=77(y), r2=86(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 77
LDI r2, 86
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
