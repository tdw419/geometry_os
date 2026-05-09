; DESCRIPTION: Composite: . Then Creates a green rectangular region at (181, 5) spanning 64 by 35 pixels. Then Sets a single magenta pixel at (73, 184).
; PLAN: r0=181(x), r1=5(y), r2=64(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=73(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (181, 5) spanning 64 by 35 pixels.
; PLAN: r0=181(x), r1=5(y), r2=64(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 5
LDI r2, 64
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (73, 184).
; PLAN: r0=73(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
