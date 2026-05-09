; DESCRIPTION: Creates a red rectangular region at (125, 3) spanning 34 by 96 pixels.
; PLAN: r0=125(x), r1=3(y), r2=34(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 3
LDI r2, 34
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
