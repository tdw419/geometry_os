; DESCRIPTION: Places a orange 64x78 rectangle at position (212, 141).
; PLAN: r0=212(x), r1=141(y), r2=64(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 141
LDI r2, 64
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
