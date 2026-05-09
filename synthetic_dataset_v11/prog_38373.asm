; DESCRIPTION: Composite: . Then Sets a single white pixel at (245, 237). Then Creates a yellow rectangular region at (34, 134) spanning 29 by 38 pixels.
; PLAN: r0=245(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=34(x), r1=134(y), r2=29(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (245, 237).
; PLAN: r0=245(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (34, 134) spanning 29 by 38 pixels.
; PLAN: r0=34(x), r1=134(y), r2=29(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 134
LDI r2, 29
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
