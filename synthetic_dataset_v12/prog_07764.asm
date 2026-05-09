; DESCRIPTION: Places a white 68x81 rectangle at position (386, 53).
; PLAN: r0=386(x), r1=53(y), r2=68(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 53
LDI r2, 68
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
