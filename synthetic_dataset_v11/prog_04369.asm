; DESCRIPTION: Composite: . Then Sets a single purple pixel at (212, 165). Then Creates a blue rectangular region at (5, 11) spanning 63 by 36 pixels.
; PLAN: r0=212(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=5(x), r1=11(y), r2=63(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (212, 165).
; PLAN: r0=212(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (5, 11) spanning 63 by 36 pixels.
; PLAN: r0=5(x), r1=11(y), r2=63(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 11
LDI r2, 63
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
