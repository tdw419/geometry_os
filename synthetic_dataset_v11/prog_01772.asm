; DESCRIPTION: Composite: . Then Draws a orange rectangle at (45, 188) with width 30 and height 22. Then Sets a single purple pixel at (26, 236).
; PLAN: r0=45(x), r1=188(y), r2=30(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=26(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (45, 188) with width 30 and height 22.
; PLAN: r0=45(x), r1=188(y), r2=30(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 188
LDI r2, 30
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (26, 236).
; PLAN: r0=26(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
