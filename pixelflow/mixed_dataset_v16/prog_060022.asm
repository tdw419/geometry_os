; DESCRIPTION: Places a white 15x17 rectangle at position (53, 139).
; PLAN: r0=53(x), r1=139(y), r2=15(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 139
LDI r2, 15
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
