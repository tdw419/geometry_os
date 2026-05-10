; DESCRIPTION: Places a orange 94x20 rectangle at position (371, 189).
; PLAN: r0=371(x), r1=189(y), r2=94(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 189
LDI r2, 94
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
