; DESCRIPTION: Composite: . Then Sets a single white pixel at (248, 225). Then Creates a red rectangular region at (129, 119) spanning 69 by 20 pixels.
; PLAN: r0=248(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=129(x), r1=119(y), r2=69(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (248, 225).
; PLAN: r0=248(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (129, 119) spanning 69 by 20 pixels.
; PLAN: r0=129(x), r1=119(y), r2=69(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 119
LDI r2, 69
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
