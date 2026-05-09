; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (31, 232). Then Renders a green box of size 69x95 starting at (56, 49).
; PLAN: r0=31(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=56(x), r1=49(y), r2=69(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (31, 232).
; PLAN: r0=31(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 232
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 69x95 starting at (56, 49).
; PLAN: r0=56(x), r1=49(y), r2=69(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 49
LDI r2, 69
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
