; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (119, 201) spanning 43 by 43 pixels. Then Sets a single black pixel at (218, 40).
; PLAN: r0=119(x), r1=201(y), r2=43(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=218(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (119, 201) spanning 43 by 43 pixels.
; PLAN: r0=119(x), r1=201(y), r2=43(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 201
LDI r2, 43
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (218, 40).
; PLAN: r0=218(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
HALT
