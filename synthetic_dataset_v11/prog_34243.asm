; DESCRIPTION: Composite: . Then Draws a orange rectangle at (214, 10) with width 15 and height 52. Then Sets a single purple pixel at (45, 128).
; PLAN: r0=214(x), r1=10(y), r2=15(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=45(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (214, 10) with width 15 and height 52.
; PLAN: r0=214(x), r1=10(y), r2=15(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 10
LDI r2, 15
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (45, 128).
; PLAN: r0=45(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
