; DESCRIPTION: Composite: . Then Renders a green box of size 102x34 starting at (113, 71). Then Sets a single magenta pixel at (223, 102).
; PLAN: r0=113(x), r1=71(y), r2=102(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=223(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 102x34 starting at (113, 71).
; PLAN: r0=113(x), r1=71(y), r2=102(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 71
LDI r2, 102
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (223, 102).
; PLAN: r0=223(x), r1=102(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 102
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
