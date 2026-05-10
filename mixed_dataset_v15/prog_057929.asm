; DESCRIPTION: Creates a red rectangular region at (276, 20) spanning 38 by 119 pixels.
; PLAN: r0=276(x), r1=20(y), r2=38(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 20
LDI r2, 38
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
