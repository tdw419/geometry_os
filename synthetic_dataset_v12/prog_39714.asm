; DESCRIPTION: Creates a white rectangular region at (102, 64) spanning 71 by 110 pixels.
; PLAN: r0=102(x), r1=64(y), r2=71(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 64
LDI r2, 71
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
