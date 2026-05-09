; DESCRIPTION: Creates a white rectangular region at (131, 96) spanning 81 by 76 pixels.
; PLAN: r0=131(x), r1=96(y), r2=81(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 96
LDI r2, 81
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
