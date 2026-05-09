; DESCRIPTION: Creates a white rectangular region at (263, 9) spanning 119 by 61 pixels.
; PLAN: r0=263(x), r1=9(y), r2=119(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 9
LDI r2, 119
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
