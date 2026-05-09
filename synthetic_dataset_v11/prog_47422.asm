; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (135, 158). Then Renders a magenta disk with center (75, 171) and radius 68.
; PLAN: r0=135(x), r1=158(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=171(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (135, 158).
; PLAN: r0=135(x), r1=158(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 158
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (75, 171) and radius 68.
; PLAN: r0=75(x), r1=171(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 171
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
