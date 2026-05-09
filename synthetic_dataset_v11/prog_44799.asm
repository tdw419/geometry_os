; DESCRIPTION: Places a white 30x69 rectangle at position (64, 56).
; PLAN: r0=64(x), r1=56(y), r2=30(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 56
LDI r2, 30
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
