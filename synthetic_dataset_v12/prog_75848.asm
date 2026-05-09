; DESCRIPTION: Creates a white rectangular region at (299, 4) spanning 56 by 46 pixels.
; PLAN: r0=299(x), r1=4(y), r2=56(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 4
LDI r2, 56
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
