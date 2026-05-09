; DESCRIPTION: Composite: . Then Places a purple dot at position (209, 72). Then Creates a green rectangular region at (36, 76) spanning 74 by 57 pixels.
; PLAN: r0=209(x), r1=72(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=36(x), r1=76(y), r2=74(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (209, 72).
; PLAN: r0=209(x), r1=72(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 72
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (36, 76) spanning 74 by 57 pixels.
; PLAN: r0=36(x), r1=76(y), r2=74(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 76
LDI r2, 74
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
