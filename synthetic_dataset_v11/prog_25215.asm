; DESCRIPTION: Composite: . Then Sets a single black pixel at (213, 248). Then Creates a yellow rectangular region at (103, 131) spanning 62 by 46 pixels.
; PLAN: r0=213(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=131(y), r2=62(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (213, 248).
; PLAN: r0=213(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 248
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (103, 131) spanning 62 by 46 pixels.
; PLAN: r0=103(x), r1=131(y), r2=62(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 131
LDI r2, 62
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
