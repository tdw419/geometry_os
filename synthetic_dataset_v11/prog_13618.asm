; DESCRIPTION: Creates a white rectangular region at (88, 134) spanning 107 by 64 pixels.
; PLAN: r0=88(x), r1=134(y), r2=107(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 134
LDI r2, 107
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
