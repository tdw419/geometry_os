; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (164, 217). Then Renders a blue box of size 85x50 starting at (133, 45).
; PLAN: r0=164(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=133(x), r1=45(y), r2=85(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (164, 217).
; PLAN: r0=164(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue box of size 85x50 starting at (133, 45).
; PLAN: r0=133(x), r1=45(y), r2=85(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 45
LDI r2, 85
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
