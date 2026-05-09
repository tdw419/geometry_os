; DESCRIPTION: Places a white 20x88 rectangle at position (227, 24).
; PLAN: r0=227(x), r1=24(y), r2=20(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 24
LDI r2, 20
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
