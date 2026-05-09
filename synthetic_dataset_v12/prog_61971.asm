; DESCRIPTION: Places a red 107x62 rectangle at position (103, 88).
; PLAN: r0=103(x), r1=88(y), r2=107(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 88
LDI r2, 107
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
