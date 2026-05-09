; DESCRIPTION: Places a white 44x74 rectangle at position (58, 88).
; PLAN: r0=58(x), r1=88(y), r2=44(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 88
LDI r2, 44
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
