; DESCRIPTION: Places a white 35x78 rectangle at position (69, 49).
; PLAN: r0=69(x), r1=49(y), r2=35(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 49
LDI r2, 35
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
