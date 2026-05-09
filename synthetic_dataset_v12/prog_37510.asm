; DESCRIPTION: Places a blue 87x18 rectangle at position (194, 149).
; PLAN: r0=194(x), r1=149(y), r2=87(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 149
LDI r2, 87
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
