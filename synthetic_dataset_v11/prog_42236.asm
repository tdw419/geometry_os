; DESCRIPTION: Composite: . Then Draws a orange rectangle at (71, 112) with width 101 and height 32. Then Sets a single yellow pixel at (249, 93).
; PLAN: r0=71(x), r1=112(y), r2=101(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=93(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (71, 112) with width 101 and height 32.
; PLAN: r0=71(x), r1=112(y), r2=101(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 112
LDI r2, 101
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (249, 93).
; PLAN: r0=249(x), r1=93(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 93
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
