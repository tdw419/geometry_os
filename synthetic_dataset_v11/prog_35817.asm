; DESCRIPTION: Composite: . Then Renders a green box of size 91x85 starting at (51, 126). Then Places a blue dot at position (228, 212).
; PLAN: r0=51(x), r1=126(y), r2=91(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=228(x), r1=212(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 91x85 starting at (51, 126).
; PLAN: r0=51(x), r1=126(y), r2=91(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 126
LDI r2, 91
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (228, 212).
; PLAN: r0=228(x), r1=212(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 212
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
