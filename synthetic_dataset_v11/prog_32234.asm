; DESCRIPTION: Composite: . Then Sets a single orange pixel at (31, 186). Then Creates a magenta rectangular region at (86, 160) spanning 93 by 64 pixels.
; PLAN: r0=31(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=86(x), r1=160(y), r2=93(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (31, 186).
; PLAN: r0=31(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (86, 160) spanning 93 by 64 pixels.
; PLAN: r0=86(x), r1=160(y), r2=93(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 160
LDI r2, 93
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
