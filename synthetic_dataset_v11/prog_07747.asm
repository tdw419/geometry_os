; DESCRIPTION: Composite: . Then Places a magenta dot at position (231, 226). Then Creates a orange rectangular region at (129, 191) spanning 74 by 52 pixels.
; PLAN: r0=231(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=129(x), r1=191(y), r2=74(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (231, 226).
; PLAN: r0=231(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (129, 191) spanning 74 by 52 pixels.
; PLAN: r0=129(x), r1=191(y), r2=74(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 191
LDI r2, 74
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
