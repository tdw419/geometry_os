; DESCRIPTION: Creates a white rectangular region at (105, 95) spanning 56 by 107 pixels.
; PLAN: r0=105(x), r1=95(y), r2=56(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 95
LDI r2, 56
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
