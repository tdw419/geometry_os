; DESCRIPTION: Composite: . Then Draws a green rectangle at (81, 93) with width 61 and height 88. Then Sets a single orange pixel at (226, 206).
; PLAN: r0=81(x), r1=93(y), r2=61(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=226(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (81, 93) with width 61 and height 88.
; PLAN: r0=81(x), r1=93(y), r2=61(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 93
LDI r2, 61
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (226, 206).
; PLAN: r0=226(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
