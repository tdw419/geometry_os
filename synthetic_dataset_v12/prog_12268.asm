; DESCRIPTION: Places a red 88x14 rectangle at position (210, 158).
; PLAN: r0=210(x), r1=158(y), r2=88(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 158
LDI r2, 88
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
