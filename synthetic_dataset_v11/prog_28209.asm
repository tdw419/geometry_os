; DESCRIPTION: Composite: . Then Creates a white rectangular region at (92, 17) spanning 112 by 11 pixels. Then Sets a single white pixel at (151, 231).
; PLAN: r0=92(x), r1=17(y), r2=112(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (92, 17) spanning 112 by 11 pixels.
; PLAN: r0=92(x), r1=17(y), r2=112(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 17
LDI r2, 112
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (151, 231).
; PLAN: r0=151(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
