; DESCRIPTION: Creates a white rectangular region at (73, 109) spanning 66 by 105 pixels.
; PLAN: r0=73(x), r1=109(y), r2=66(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 109
LDI r2, 66
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
