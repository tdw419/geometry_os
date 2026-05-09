; DESCRIPTION: Creates a white rectangular region at (107, 105) spanning 86 by 84 pixels.
; PLAN: r0=107(x), r1=105(y), r2=86(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 105
LDI r2, 86
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
