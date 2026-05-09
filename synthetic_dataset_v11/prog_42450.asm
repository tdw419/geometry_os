; DESCRIPTION: Composite: . Then Renders a blue box of size 12x50 starting at (3, 185). Then Places a purple dot at position (54, 163).
; PLAN: r0=3(x), r1=185(y), r2=12(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=54(x), r1=163(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 12x50 starting at (3, 185).
; PLAN: r0=3(x), r1=185(y), r2=12(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 185
LDI r2, 12
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (54, 163).
; PLAN: r0=54(x), r1=163(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 163
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
