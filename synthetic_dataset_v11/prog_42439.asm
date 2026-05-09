; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (72, 59) spanning 51 by 22 pixels. Then Sets a single magenta pixel at (141, 183).
; PLAN: r0=72(x), r1=59(y), r2=51(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=141(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange rectangular region at (72, 59) spanning 51 by 22 pixels.
; PLAN: r0=72(x), r1=59(y), r2=51(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 59
LDI r2, 51
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (141, 183).
; PLAN: r0=141(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
