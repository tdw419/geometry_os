; DESCRIPTION: Creates a white rectangular region at (143, 75) spanning 82 by 34 pixels.
; PLAN: r0=143(x), r1=75(y), r2=82(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 75
LDI r2, 82
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
