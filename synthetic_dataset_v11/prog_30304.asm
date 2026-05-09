; DESCRIPTION: Places a blue 32x106 rectangle at position (15, 108).
; PLAN: r0=15(x), r1=108(y), r2=32(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 108
LDI r2, 32
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
