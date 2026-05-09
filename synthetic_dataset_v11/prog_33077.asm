; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (53, 70) with width 57 and height 114. Then Places a purple dot at position (171, 90).
; PLAN: r0=53(x), r1=70(y), r2=57(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=171(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (53, 70) with width 57 and height 114.
; PLAN: r0=53(x), r1=70(y), r2=57(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 70
LDI r2, 57
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (171, 90).
; PLAN: r0=171(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 90
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
