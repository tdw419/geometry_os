; DESCRIPTION: Composite: . Then Renders a blue box of size 29x29 starting at (94, 35). Then Places a magenta dot at position (1, 232).
; PLAN: r0=94(x), r1=35(y), r2=29(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 29x29 starting at (94, 35).
; PLAN: r0=94(x), r1=35(y), r2=29(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 35
LDI r2, 29
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (1, 232).
; PLAN: r0=1(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 232
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
