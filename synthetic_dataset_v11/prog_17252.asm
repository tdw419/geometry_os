; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (69, 211). Then Renders a magenta box of size 42x22 starting at (69, 112).
; PLAN: r0=69(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=112(y), r2=42(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (69, 211).
; PLAN: r0=69(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 42x22 starting at (69, 112).
; PLAN: r0=69(x), r1=112(y), r2=42(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 112
LDI r2, 42
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
