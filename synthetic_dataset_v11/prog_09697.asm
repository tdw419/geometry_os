; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (155, 42). Then Renders a magenta box of size 14x26 starting at (217, 192).
; PLAN: r0=155(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=217(x), r1=192(y), r2=14(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (155, 42).
; PLAN: r0=155(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 14x26 starting at (217, 192).
; PLAN: r0=217(x), r1=192(y), r2=14(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 192
LDI r2, 14
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
