; DESCRIPTION: Creates a red rectangular region at (70, 70) spanning 52 by 83 pixels.
; PLAN: r0=70(x), r1=70(y), r2=52(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 70
LDI r2, 52
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
