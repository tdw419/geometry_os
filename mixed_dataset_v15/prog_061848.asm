; DESCRIPTION: Creates a white rectangular region at (153, 112) spanning 89 by 82 pixels.
; PLAN: r0=153(x), r1=112(y), r2=89(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 112
LDI r2, 89
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
