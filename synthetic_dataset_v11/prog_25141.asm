; DESCRIPTION: Creates a red rectangular region at (28, 15) spanning 73 by 66 pixels.
; PLAN: r0=28(x), r1=15(y), r2=73(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 15
LDI r2, 73
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
