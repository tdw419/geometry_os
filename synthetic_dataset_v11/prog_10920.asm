; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (118, 71) spanning 111 by 82 pixels. Then Sets a single yellow pixel at (234, 35).
; PLAN: r0=118(x), r1=71(y), r2=111(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (118, 71) spanning 111 by 82 pixels.
; PLAN: r0=118(x), r1=71(y), r2=111(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 71
LDI r2, 111
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (234, 35).
; PLAN: r0=234(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
