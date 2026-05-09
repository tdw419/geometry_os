; DESCRIPTION: Places a orange 33x60 rectangle at position (84, 128).
; PLAN: r0=84(x), r1=128(y), r2=33(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 128
LDI r2, 33
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
