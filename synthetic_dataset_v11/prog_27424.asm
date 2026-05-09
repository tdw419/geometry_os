; DESCRIPTION: Composite: . Then Sets a single green pixel at (13, 189). Then Creates a black rectangular region at (150, 151) spanning 102 by 21 pixels.
; PLAN: r0=13(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=151(y), r2=102(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (13, 189).
; PLAN: r0=13(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a black rectangular region at (150, 151) spanning 102 by 21 pixels.
; PLAN: r0=150(x), r1=151(y), r2=102(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 151
LDI r2, 102
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
