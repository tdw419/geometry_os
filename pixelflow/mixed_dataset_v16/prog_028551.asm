; DESCRIPTION: Places a orange 78x60 rectangle at position (419, 158).
; PLAN: r0=419(x), r1=158(y), r2=78(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 158
LDI r2, 78
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
