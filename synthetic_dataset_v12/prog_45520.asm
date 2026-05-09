; DESCRIPTION: Places a cyan 87x70 rectangle at position (381, 62).
; PLAN: r0=381(x), r1=62(y), r2=87(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 62
LDI r2, 87
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
