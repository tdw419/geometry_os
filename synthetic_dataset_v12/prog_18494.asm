; DESCRIPTION: Creates a white rectangular region at (268, 159) spanning 30 by 84 pixels.
; PLAN: r0=268(x), r1=159(y), r2=30(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 159
LDI r2, 30
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
