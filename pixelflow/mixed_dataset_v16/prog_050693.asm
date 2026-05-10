; DESCRIPTION: Places a white 29x69 rectangle at position (165, 102).
; PLAN: r0=165(x), r1=102(y), r2=29(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 102
LDI r2, 29
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
