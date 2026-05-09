; DESCRIPTION: Places a white 49x35 rectangle at position (93, 170).
; PLAN: r0=93(x), r1=170(y), r2=49(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 170
LDI r2, 49
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
