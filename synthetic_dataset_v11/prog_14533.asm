; DESCRIPTION: Composite: . Then Places a yellow dot at position (24, 166). Then Draws a blue rectangle at (142, 29) with width 59 and height 76.
; PLAN: r0=24(x), r1=166(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=142(x), r1=29(y), r2=59(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (24, 166).
; PLAN: r0=24(x), r1=166(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 166
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (142, 29) with width 59 and height 76.
; PLAN: r0=142(x), r1=29(y), r2=59(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 29
LDI r2, 59
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
