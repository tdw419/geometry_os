; DESCRIPTION: Places a white 112x69 rectangle at position (333, 53).
; PLAN: r0=333(x), r1=53(y), r2=112(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 53
LDI r2, 112
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
