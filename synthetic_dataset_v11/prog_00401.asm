; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (79, 28). Then Renders a green box of size 53x43 starting at (42, 78).
; PLAN: r0=79(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=42(x), r1=78(y), r2=53(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (79, 28).
; PLAN: r0=79(x), r1=28(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 28
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 53x43 starting at (42, 78).
; PLAN: r0=42(x), r1=78(y), r2=53(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 78
LDI r2, 53
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
