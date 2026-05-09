; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (93, 120) with width 66 and height 55. Then Places a orange dot at position (18, 61).
; PLAN: r0=93(x), r1=120(y), r2=66(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=18(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (93, 120) with width 66 and height 55.
; PLAN: r0=93(x), r1=120(y), r2=66(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 120
LDI r2, 66
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (18, 61).
; PLAN: r0=18(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 61
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
