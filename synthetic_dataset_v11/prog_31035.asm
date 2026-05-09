; DESCRIPTION: Composite: . Then Places a purple dot at position (136, 41). Then Creates a magenta rectangular region at (80, 80) spanning 58 by 23 pixels.
; PLAN: r0=136(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=80(x), r1=80(y), r2=58(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (136, 41).
; PLAN: r0=136(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (80, 80) spanning 58 by 23 pixels.
; PLAN: r0=80(x), r1=80(y), r2=58(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 80
LDI r2, 58
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
