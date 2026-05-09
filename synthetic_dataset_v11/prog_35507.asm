; DESCRIPTION: Creates a white rectangular region at (97, 80) spanning 82 by 56 pixels.
; PLAN: r0=97(x), r1=80(y), r2=82(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 80
LDI r2, 82
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
