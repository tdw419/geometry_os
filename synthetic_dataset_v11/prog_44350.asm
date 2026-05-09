; DESCRIPTION: Composite: . Then Renders a blue box of size 102x50 starting at (122, 201). Then Places a green dot at position (26, 23).
; PLAN: r0=122(x), r1=201(y), r2=102(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=26(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 102x50 starting at (122, 201).
; PLAN: r0=122(x), r1=201(y), r2=102(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 201
LDI r2, 102
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (26, 23).
; PLAN: r0=26(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 23
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
