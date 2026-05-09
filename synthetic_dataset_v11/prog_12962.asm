; DESCRIPTION: Composite: . Then Places a blue dot at position (36, 216). Then Draws a orange rectangle at (12, 13) with width 106 and height 118.
; PLAN: r0=36(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=12(x), r1=13(y), r2=106(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (36, 216).
; PLAN: r0=36(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (12, 13) with width 106 and height 118.
; PLAN: r0=12(x), r1=13(y), r2=106(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 13
LDI r2, 106
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
