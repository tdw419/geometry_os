; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (171, 117) with radius 72. Then Sets a single magenta pixel at (206, 191).
; PLAN: r0=171(x), r1=117(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (171, 117) with radius 72.
; PLAN: r0=171(x), r1=117(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 117
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (206, 191).
; PLAN: r0=206(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
