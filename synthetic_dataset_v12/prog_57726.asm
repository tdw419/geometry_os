; DESCRIPTION: Places a green 79x101 rectangle at position (219, 62).
; PLAN: r0=219(x), r1=62(y), r2=79(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 62
LDI r2, 79
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
