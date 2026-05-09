; DESCRIPTION: Places a orange 64x25 rectangle at position (337, 78).
; PLAN: r0=337(x), r1=78(y), r2=64(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 78
LDI r2, 64
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
