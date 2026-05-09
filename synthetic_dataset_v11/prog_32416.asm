; DESCRIPTION: Composite: . Then Draws a red rectangle at (170, 131) with width 78 and height 67. Then Places a purple dot at position (146, 42).
; PLAN: r0=170(x), r1=131(y), r2=78(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=146(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (170, 131) with width 78 and height 67.
; PLAN: r0=170(x), r1=131(y), r2=78(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 131
LDI r2, 78
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (146, 42).
; PLAN: r0=146(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
