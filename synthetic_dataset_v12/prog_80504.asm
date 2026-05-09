; DESCRIPTION: Places a orange 38x84 rectangle at position (371, 58).
; PLAN: r0=371(x), r1=58(y), r2=38(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 58
LDI r2, 38
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
