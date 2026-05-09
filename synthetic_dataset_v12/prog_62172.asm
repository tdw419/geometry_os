; DESCRIPTION: Places a red 21x114 rectangle at position (232, 14).
; PLAN: r0=232(x), r1=14(y), r2=21(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 14
LDI r2, 21
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
