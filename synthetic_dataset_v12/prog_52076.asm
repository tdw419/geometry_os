; DESCRIPTION: Places a orange 89x81 rectangle at position (64, 98).
; PLAN: r0=64(x), r1=98(y), r2=89(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 98
LDI r2, 89
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
