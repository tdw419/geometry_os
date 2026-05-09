; DESCRIPTION: Composite: . Then Creates a green rectangular region at (127, 48) spanning 97 by 30 pixels. Then Sets a single black pixel at (18, 199).
; PLAN: r0=127(x), r1=48(y), r2=97(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=18(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (127, 48) spanning 97 by 30 pixels.
; PLAN: r0=127(x), r1=48(y), r2=97(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 48
LDI r2, 97
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (18, 199).
; PLAN: r0=18(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
HALT
