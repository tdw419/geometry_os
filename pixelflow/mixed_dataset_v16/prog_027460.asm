; DESCRIPTION: Places a orange 73x24 rectangle at position (339, 219).
; PLAN: r0=339(x), r1=219(y), r2=73(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 219
LDI r2, 73
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
