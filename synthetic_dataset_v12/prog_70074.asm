; DESCRIPTION: Creates a white rectangular region at (249, 80) spanning 78 by 82 pixels.
; PLAN: r0=249(x), r1=80(y), r2=78(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 80
LDI r2, 78
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
