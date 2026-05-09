; DESCRIPTION: Places a white 53x96 rectangle at position (299, 102).
; PLAN: r0=299(x), r1=102(y), r2=53(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 102
LDI r2, 53
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
