; DESCRIPTION: Creates a red rectangular region at (5, 61) spanning 74 by 84 pixels.
; PLAN: r0=5(x), r1=61(y), r2=74(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 61
LDI r2, 74
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
