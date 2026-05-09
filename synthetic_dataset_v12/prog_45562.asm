; DESCRIPTION: Places a blue 26x31 rectangle at position (318, 4).
; PLAN: r0=318(x), r1=4(y), r2=26(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 4
LDI r2, 26
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
