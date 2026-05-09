; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (56, 94) with width 72 and height 55. Then Places a purple dot at position (234, 61).
; PLAN: r0=56(x), r1=94(y), r2=72(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (56, 94) with width 72 and height 55.
; PLAN: r0=56(x), r1=94(y), r2=72(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 94
LDI r2, 72
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (234, 61).
; PLAN: r0=234(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
