; DESCRIPTION: Places a white 17x78 rectangle at position (182, 53).
; PLAN: r0=182(x), r1=53(y), r2=17(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 53
LDI r2, 17
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
