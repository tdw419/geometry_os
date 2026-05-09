; DESCRIPTION: Composite: . Then Places a purple dot at position (96, 136). Then Draws a red rectangle at (148, 30) with width 107 and height 23.
; PLAN: r0=96(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=148(x), r1=30(y), r2=107(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (96, 136).
; PLAN: r0=96(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (148, 30) with width 107 and height 23.
; PLAN: r0=148(x), r1=30(y), r2=107(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 30
LDI r2, 107
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
