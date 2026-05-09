; DESCRIPTION: Composite: . Then Places a yellow dot at position (131, 17). Then Draws a green rectangle at (159, 70) with width 24 and height 118.
; PLAN: r0=131(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=159(x), r1=70(y), r2=24(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (131, 17).
; PLAN: r0=131(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (159, 70) with width 24 and height 118.
; PLAN: r0=159(x), r1=70(y), r2=24(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 70
LDI r2, 24
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
