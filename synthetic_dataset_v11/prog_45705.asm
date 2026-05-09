; DESCRIPTION: Composite: . Then Sets a single purple pixel at (193, 168). Then Creates a magenta rectangular region at (43, 24) spanning 100 by 63 pixels.
; PLAN: r0=193(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=43(x), r1=24(y), r2=100(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (193, 168).
; PLAN: r0=193(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (43, 24) spanning 100 by 63 pixels.
; PLAN: r0=43(x), r1=24(y), r2=100(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 24
LDI r2, 100
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
