; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (223, 61). Then Creates a yellow rectangular region at (65, 61) spanning 33 by 51 pixels.
; PLAN: r0=223(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=61(y), r2=33(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (223, 61).
; PLAN: r0=223(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (65, 61) spanning 33 by 51 pixels.
; PLAN: r0=65(x), r1=61(y), r2=33(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 61
LDI r2, 33
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
