; DESCRIPTION: Composite: . Then Sets a single orange pixel at (251, 225). Then Draws a white rectangle at (180, 105) with width 19 and height 85.
; PLAN: r0=251(x), r1=225(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=180(x), r1=105(y), r2=19(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (251, 225).
; PLAN: r0=251(x), r1=225(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 225
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (180, 105) with width 19 and height 85.
; PLAN: r0=180(x), r1=105(y), r2=19(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 105
LDI r2, 19
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
