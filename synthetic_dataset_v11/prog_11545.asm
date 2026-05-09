; DESCRIPTION: Composite: . Then Creates a white rectangular region at (115, 73) spanning 78 by 17 pixels. Then Sets a single cyan pixel at (148, 99).
; PLAN: r0=115(x), r1=73(y), r2=78(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=148(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (115, 73) spanning 78 by 17 pixels.
; PLAN: r0=115(x), r1=73(y), r2=78(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 73
LDI r2, 78
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (148, 99).
; PLAN: r0=148(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
