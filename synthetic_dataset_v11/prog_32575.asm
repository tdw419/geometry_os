; DESCRIPTION: Composite: . Then Places a black dot at position (122, 250). Then Renders a magenta box of size 21x100 starting at (126, 18).
; PLAN: r0=122(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=126(x), r1=18(y), r2=21(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (122, 250).
; PLAN: r0=122(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 250
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 21x100 starting at (126, 18).
; PLAN: r0=126(x), r1=18(y), r2=21(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 18
LDI r2, 21
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
