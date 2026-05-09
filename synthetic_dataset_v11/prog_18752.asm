; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (159, 154) spanning 88 by 73 pixels. Then Sets a single yellow pixel at (217, 94).
; PLAN: r0=159(x), r1=154(y), r2=88(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=217(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple rectangular region at (159, 154) spanning 88 by 73 pixels.
; PLAN: r0=159(x), r1=154(y), r2=88(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 154
LDI r2, 88
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (217, 94).
; PLAN: r0=217(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
