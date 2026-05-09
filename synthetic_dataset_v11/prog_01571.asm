; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (17, 147) spanning 87 by 41 pixels. Then Sets a single black pixel at (39, 82).
; PLAN: r0=17(x), r1=147(y), r2=87(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=39(x), r1=82(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (17, 147) spanning 87 by 41 pixels.
; PLAN: r0=17(x), r1=147(y), r2=87(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 147
LDI r2, 87
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (39, 82).
; PLAN: r0=39(x), r1=82(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 82
LDI r2, 0x000000
PSET r0, r1, r2
HALT
