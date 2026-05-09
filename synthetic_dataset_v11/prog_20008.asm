; DESCRIPTION: Creates a white rectangular region at (131, 64) spanning 69 by 56 pixels.
; PLAN: r0=131(x), r1=64(y), r2=69(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 64
LDI r2, 69
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
