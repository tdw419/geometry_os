; DESCRIPTION: Places a white 49x20 rectangle at position (62, 217).
; PLAN: r0=62(x), r1=217(y), r2=49(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 217
LDI r2, 49
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
