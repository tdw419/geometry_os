; DESCRIPTION: Creates a white rectangular region at (216, 61) spanning 107 by 15 pixels.
; PLAN: r0=216(x), r1=61(y), r2=107(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 61
LDI r2, 107
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
