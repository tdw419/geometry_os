; DESCRIPTION: Composite: . Then Sets a single black pixel at (81, 195). Then Creates a white rectangular region at (44, 13) spanning 117 by 52 pixels.
; PLAN: r0=81(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=44(x), r1=13(y), r2=117(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (81, 195).
; PLAN: r0=81(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (44, 13) spanning 117 by 52 pixels.
; PLAN: r0=44(x), r1=13(y), r2=117(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 13
LDI r2, 117
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
