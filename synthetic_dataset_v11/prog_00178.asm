; DESCRIPTION: Composite: . Then Renders a purple box of size 42x104 starting at (43, 42). Then Sets a single yellow pixel at (218, 245).
; PLAN: r0=43(x), r1=42(y), r2=42(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=218(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple box of size 42x104 starting at (43, 42).
; PLAN: r0=43(x), r1=42(y), r2=42(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 42
LDI r2, 42
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (218, 245).
; PLAN: r0=218(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 245
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
