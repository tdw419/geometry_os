; DESCRIPTION: Places a red 74x62 rectangle at position (88, 119).
; PLAN: r0=88(x), r1=119(y), r2=74(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 119
LDI r2, 74
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
