; DESCRIPTION: Composite: . Then Renders a green box of size 66x85 starting at (83, 158). Then Places a green dot at position (6, 114).
; PLAN: r0=83(x), r1=158(y), r2=66(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=6(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 66x85 starting at (83, 158).
; PLAN: r0=83(x), r1=158(y), r2=66(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 158
LDI r2, 66
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (6, 114).
; PLAN: r0=6(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
