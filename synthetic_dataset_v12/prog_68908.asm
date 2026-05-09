; DESCRIPTION: Places a white 58x53 rectangle at position (102, 157).
; PLAN: r0=102(x), r1=157(y), r2=58(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 157
LDI r2, 58
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
