; DESCRIPTION: Places a magenta 62x87 rectangle at position (136, 13).
; PLAN: r0=136(x), r1=13(y), r2=62(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 13
LDI r2, 62
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
