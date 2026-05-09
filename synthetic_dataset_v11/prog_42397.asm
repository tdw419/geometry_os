; DESCRIPTION: Creates a white rectangular region at (146, 29) spanning 34 by 116 pixels.
; PLAN: r0=146(x), r1=29(y), r2=34(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 29
LDI r2, 34
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
