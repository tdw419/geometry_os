; DESCRIPTION: Creates a white rectangular region at (40, 114) spanning 82 by 100 pixels.
; PLAN: r0=40(x), r1=114(y), r2=82(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 114
LDI r2, 82
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
