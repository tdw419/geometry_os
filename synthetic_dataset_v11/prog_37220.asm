; DESCRIPTION: Creates a white rectangular region at (74, 218) spanning 14 by 16 pixels.
; PLAN: r0=74(x), r1=218(y), r2=14(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 218
LDI r2, 14
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
