; DESCRIPTION: Places a white 62x120 rectangle at position (437, 88).
; PLAN: r0=437(x), r1=88(y), r2=62(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 88
LDI r2, 62
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
