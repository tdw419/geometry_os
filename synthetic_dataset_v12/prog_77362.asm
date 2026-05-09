; DESCRIPTION: Places a white 73x69 rectangle at position (381, 156).
; PLAN: r0=381(x), r1=156(y), r2=73(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 156
LDI r2, 73
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
