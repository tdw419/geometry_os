; DESCRIPTION: Composite: . Then Places a white dot at position (189, 176). Then Draws a orange rectangle at (216, 150) with width 28 and height 59.
; PLAN: r0=189(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=216(x), r1=150(y), r2=28(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (189, 176).
; PLAN: r0=189(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (216, 150) with width 28 and height 59.
; PLAN: r0=216(x), r1=150(y), r2=28(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 150
LDI r2, 28
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
