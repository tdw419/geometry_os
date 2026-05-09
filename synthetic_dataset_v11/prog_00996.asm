; DESCRIPTION: Composite: . Then Places a purple dot at position (223, 147). Then Creates a red rectangular region at (12, 56) spanning 116 by 23 pixels.
; PLAN: r0=223(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=12(x), r1=56(y), r2=116(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (223, 147).
; PLAN: r0=223(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 147
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (12, 56) spanning 116 by 23 pixels.
; PLAN: r0=12(x), r1=56(y), r2=116(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 56
LDI r2, 116
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
