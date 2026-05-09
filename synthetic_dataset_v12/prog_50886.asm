; DESCRIPTION: Places a red 10x75 rectangle at position (143, 88).
; PLAN: r0=143(x), r1=88(y), r2=10(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 88
LDI r2, 10
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
