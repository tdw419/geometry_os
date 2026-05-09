; DESCRIPTION: Creates a white rectangular region at (289, 28) spanning 78 by 80 pixels.
; PLAN: r0=289(x), r1=28(y), r2=78(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 28
LDI r2, 78
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
