; DESCRIPTION: Places a red 118x55 rectangle at position (3, 53).
; PLAN: r0=3(x), r1=53(y), r2=118(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 53
LDI r2, 118
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
