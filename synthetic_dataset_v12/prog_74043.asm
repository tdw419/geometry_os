; DESCRIPTION: Creates a white rectangular region at (276, 22) spanning 74 by 74 pixels.
; PLAN: r0=276(x), r1=22(y), r2=74(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 22
LDI r2, 74
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
