; DESCRIPTION: Places a white 101x69 rectangle at position (14, 59).
; PLAN: r0=14(x), r1=59(y), r2=101(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 59
LDI r2, 101
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
