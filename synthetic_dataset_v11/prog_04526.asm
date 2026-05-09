; DESCRIPTION: Places a white 36x115 rectangle at position (138, 69).
; PLAN: r0=138(x), r1=69(y), r2=36(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 69
LDI r2, 36
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
