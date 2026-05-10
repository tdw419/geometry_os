; DESCRIPTION: Places a white 73x69 rectangle at position (35, 140).
; PLAN: r0=35(x), r1=140(y), r2=73(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 140
LDI r2, 73
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
