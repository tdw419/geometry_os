; DESCRIPTION: Composite: . Then Places a yellow dot at position (178, 62). Then Creates a green rectangular region at (140, 203) spanning 112 by 28 pixels.
; PLAN: r0=178(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=140(x), r1=203(y), r2=112(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (178, 62).
; PLAN: r0=178(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (140, 203) spanning 112 by 28 pixels.
; PLAN: r0=140(x), r1=203(y), r2=112(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 203
LDI r2, 112
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
