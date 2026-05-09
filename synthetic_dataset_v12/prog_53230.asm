; DESCRIPTION: Places a red 53x114 rectangle at position (249, 141).
; PLAN: r0=249(x), r1=141(y), r2=53(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 141
LDI r2, 53
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
