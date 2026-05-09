; DESCRIPTION: Composite: . Then Places a red dot at position (141, 43). Then Draws a orange rectangle at (93, 8) with width 29 and height 88.
; PLAN: r0=141(x), r1=43(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=8(y), r2=29(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (141, 43).
; PLAN: r0=141(x), r1=43(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 43
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (93, 8) with width 29 and height 88.
; PLAN: r0=93(x), r1=8(y), r2=29(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 8
LDI r2, 29
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
