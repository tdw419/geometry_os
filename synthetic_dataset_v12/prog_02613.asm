; DESCRIPTION: Creates a white rectangular region at (397, 95) spanning 74 by 91 pixels.
; PLAN: r0=397(x), r1=95(y), r2=74(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 95
LDI r2, 74
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
