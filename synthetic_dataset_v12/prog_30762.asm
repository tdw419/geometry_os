; DESCRIPTION: Creates a white rectangular region at (64, 148) spanning 15 by 83 pixels.
; PLAN: r0=64(x), r1=148(y), r2=15(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 148
LDI r2, 15
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
