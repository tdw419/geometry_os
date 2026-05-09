; DESCRIPTION: Composite: . Then Creates a black rectangular region at (79, 83) spanning 34 by 33 pixels. Then Sets a single yellow pixel at (57, 88).
; PLAN: r0=79(x), r1=83(y), r2=34(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=57(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (79, 83) spanning 34 by 33 pixels.
; PLAN: r0=79(x), r1=83(y), r2=34(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 83
LDI r2, 34
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (57, 88).
; PLAN: r0=57(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
