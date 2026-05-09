; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (139, 64) spanning 79 by 59 pixels. Then Sets a single blue pixel at (168, 174).
; PLAN: r0=139(x), r1=64(y), r2=79(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=168(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange rectangular region at (139, 64) spanning 79 by 59 pixels.
; PLAN: r0=139(x), r1=64(y), r2=79(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 64
LDI r2, 79
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (168, 174).
; PLAN: r0=168(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 174
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
