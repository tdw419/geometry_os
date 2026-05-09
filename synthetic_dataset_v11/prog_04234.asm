; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (1, 89). Then Creates a purple rectangular region at (126, 62) spanning 66 by 69 pixels.
; PLAN: r0=1(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=126(x), r1=62(y), r2=66(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (1, 89).
; PLAN: r0=1(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (126, 62) spanning 66 by 69 pixels.
; PLAN: r0=126(x), r1=62(y), r2=66(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 62
LDI r2, 66
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
