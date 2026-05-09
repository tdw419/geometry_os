; DESCRIPTION: Composite: . Then Renders a green disk with center (121, 116) and radius 79. Then Sets a single magenta pixel at (212, 79).
; PLAN: r0=121(x), r1=116(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=212(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green disk with center (121, 116) and radius 79.
; PLAN: r0=121(x), r1=116(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 116
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (212, 79).
; PLAN: r0=212(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
