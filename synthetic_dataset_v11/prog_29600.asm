; DESCRIPTION: Composite: . Then Creates a green rectangular region at (11, 16) spanning 108 by 19 pixels. Then Sets a single magenta pixel at (143, 20).
; PLAN: r0=11(x), r1=16(y), r2=108(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=143(x), r1=20(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (11, 16) spanning 108 by 19 pixels.
; PLAN: r0=11(x), r1=16(y), r2=108(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 16
LDI r2, 108
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (143, 20).
; PLAN: r0=143(x), r1=20(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 20
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
