; DESCRIPTION: Places a red 37x34 rectangle at position (53, 106).
; PLAN: r0=53(x), r1=106(y), r2=37(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 106
LDI r2, 37
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
