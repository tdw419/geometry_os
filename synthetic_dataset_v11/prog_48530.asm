; DESCRIPTION: Composite: . Then Sets a single blue pixel at (192, 34). Then Creates a yellow rectangular region at (112, 115) spanning 43 by 102 pixels.
; PLAN: r0=192(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=112(x), r1=115(y), r2=43(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (192, 34).
; PLAN: r0=192(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 34
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (112, 115) spanning 43 by 102 pixels.
; PLAN: r0=112(x), r1=115(y), r2=43(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 115
LDI r2, 43
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
