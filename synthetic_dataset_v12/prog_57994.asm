; DESCRIPTION: Places a red 38x70 rectangle at position (88, 102).
; PLAN: r0=88(x), r1=102(y), r2=38(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 102
LDI r2, 38
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
