; DESCRIPTION: Creates a white rectangular region at (93, 53) spanning 64 by 105 pixels.
; PLAN: r0=93(x), r1=53(y), r2=64(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 53
LDI r2, 64
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
