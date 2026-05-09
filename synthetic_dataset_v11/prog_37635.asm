; DESCRIPTION: Composite: . Then Sets a single white pixel at (55, 129). Then Creates a blue rectangular region at (188, 0) spanning 65 by 44 pixels.
; PLAN: r0=55(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=188(x), r1=0(y), r2=65(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (55, 129).
; PLAN: r0=55(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (188, 0) spanning 65 by 44 pixels.
; PLAN: r0=188(x), r1=0(y), r2=65(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 0
LDI r2, 65
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
