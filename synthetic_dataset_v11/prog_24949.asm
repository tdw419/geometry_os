; DESCRIPTION: Creates a red rectangular region at (25, 39) spanning 115 by 22 pixels.
; PLAN: r0=25(x), r1=39(y), r2=115(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 39
LDI r2, 115
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
