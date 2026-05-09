; DESCRIPTION: Creates a white rectangular region at (23, 97) spanning 82 by 105 pixels.
; PLAN: r0=23(x), r1=97(y), r2=82(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 97
LDI r2, 82
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
