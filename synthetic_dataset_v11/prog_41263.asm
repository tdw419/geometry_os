; DESCRIPTION: Composite: . Then Sets a single orange pixel at (187, 6). Then Draws a blue rectangle at (6, 215) with width 73 and height 41.
; PLAN: r0=187(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=6(x), r1=215(y), r2=73(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (187, 6).
; PLAN: r0=187(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (6, 215) with width 73 and height 41.
; PLAN: r0=6(x), r1=215(y), r2=73(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 215
LDI r2, 73
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
