; DESCRIPTION: Places a white 26x53 rectangle at position (390, 95).
; PLAN: r0=390(x), r1=95(y), r2=26(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 95
LDI r2, 26
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
