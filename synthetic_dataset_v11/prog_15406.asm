; DESCRIPTION: Places a red 89x24 rectangle at position (11, 219).
; PLAN: r0=11(x), r1=219(y), r2=89(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 219
LDI r2, 89
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
