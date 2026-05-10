; DESCRIPTION: Places a red 92x115 rectangle at position (162, 69).
; PLAN: r0=162(x), r1=69(y), r2=92(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 69
LDI r2, 92
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
