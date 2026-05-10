; DESCRIPTION: Places a orange 59x32 box at position (299, 64).
; PLAN: r0=299(x), r1=64(y), r2=59(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 64
LDI r2, 59
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
