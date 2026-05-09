; DESCRIPTION: Places a magenta 32x70 rectangle at position (455, 22).
; PLAN: r0=455(x), r1=22(y), r2=32(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 22
LDI r2, 32
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
