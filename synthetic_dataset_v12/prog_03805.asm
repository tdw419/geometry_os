; DESCRIPTION: Creates a white rectangular region at (371, 105) spanning 57 by 105 pixels.
; PLAN: r0=371(x), r1=105(y), r2=57(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 105
LDI r2, 57
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
