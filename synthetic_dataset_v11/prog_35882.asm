; DESCRIPTION: Places a red 100x75 rectangle at position (88, 115).
; PLAN: r0=88(x), r1=115(y), r2=100(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 115
LDI r2, 100
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
