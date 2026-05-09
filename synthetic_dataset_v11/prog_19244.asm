; DESCRIPTION: Places a white 74x19 rectangle at position (37, 69).
; PLAN: r0=37(x), r1=69(y), r2=74(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 69
LDI r2, 74
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
