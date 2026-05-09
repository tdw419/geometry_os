; DESCRIPTION: Places a white 78x53 rectangle at position (157, 58).
; PLAN: r0=157(x), r1=58(y), r2=78(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 58
LDI r2, 78
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
