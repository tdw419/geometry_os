; DESCRIPTION: Creates a white rectangular region at (405, 183) spanning 89 by 64 pixels.
; PLAN: r0=405(x), r1=183(y), r2=89(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 183
LDI r2, 89
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
