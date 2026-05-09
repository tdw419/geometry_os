; DESCRIPTION: Places a white 69x14 rectangle at position (89, 219).
; PLAN: r0=89(x), r1=219(y), r2=69(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 219
LDI r2, 69
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
