; DESCRIPTION: Composite: . Then Places a white dot at position (28, 0). Then Draws a red rectangle at (69, 12) with width 107 and height 25.
; PLAN: r0=28(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=12(y), r2=107(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (28, 0).
; PLAN: r0=28(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (69, 12) with width 107 and height 25.
; PLAN: r0=69(x), r1=12(y), r2=107(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 12
LDI r2, 107
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
