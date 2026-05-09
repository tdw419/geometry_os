; DESCRIPTION: Composite: . Then Sets a single white pixel at (215, 141). Then Renders a blue box of size 106x101 starting at (68, 126).
; PLAN: r0=215(x), r1=141(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=68(x), r1=126(y), r2=106(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (215, 141).
; PLAN: r0=215(x), r1=141(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 141
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue box of size 106x101 starting at (68, 126).
; PLAN: r0=68(x), r1=126(y), r2=106(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 126
LDI r2, 106
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
