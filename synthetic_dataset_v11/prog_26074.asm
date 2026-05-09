; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (185, 131) spanning 30 by 106 pixels. Then Sets a single green pixel at (226, 63).
; PLAN: r0=185(x), r1=131(y), r2=30(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=226(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (185, 131) spanning 30 by 106 pixels.
; PLAN: r0=185(x), r1=131(y), r2=30(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 131
LDI r2, 30
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (226, 63).
; PLAN: r0=226(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
