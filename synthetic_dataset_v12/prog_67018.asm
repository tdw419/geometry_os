; DESCRIPTION: Creates a white rectangular region at (266, 22) spanning 64 by 90 pixels.
; PLAN: r0=266(x), r1=22(y), r2=64(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 22
LDI r2, 64
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
