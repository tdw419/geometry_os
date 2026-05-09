; DESCRIPTION: Places a red 115x78 rectangle at position (69, 162).
; PLAN: r0=69(x), r1=162(y), r2=115(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 162
LDI r2, 115
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
