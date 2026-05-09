; DESCRIPTION: Creates a white rectangular region at (82, 11) spanning 108 by 118 pixels.
; PLAN: r0=82(x), r1=11(y), r2=108(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 11
LDI r2, 108
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
