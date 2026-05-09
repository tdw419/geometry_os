; DESCRIPTION: Creates a white rectangular region at (226, 184) spanning 100 by 60 pixels.
; PLAN: r0=226(x), r1=184(y), r2=100(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 184
LDI r2, 100
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
