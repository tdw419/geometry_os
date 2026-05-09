; DESCRIPTION: Places a white 45x84 rectangle at position (417, 62).
; PLAN: r0=417(x), r1=62(y), r2=45(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 62
LDI r2, 45
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
