; DESCRIPTION: Composite: . Then Renders a blue box of size 44x97 starting at (107, 78). Then Places a yellow dot at position (158, 134).
; PLAN: r0=107(x), r1=78(y), r2=44(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=158(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 44x97 starting at (107, 78).
; PLAN: r0=107(x), r1=78(y), r2=44(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 78
LDI r2, 44
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (158, 134).
; PLAN: r0=158(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
