; DESCRIPTION: Creates a red rectangular region at (360, 75) spanning 66 by 29 pixels.
; PLAN: r0=360(x), r1=75(y), r2=66(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 75
LDI r2, 66
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
