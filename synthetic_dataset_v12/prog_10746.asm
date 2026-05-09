; DESCRIPTION: Places a magenta 84x22 rectangle at position (370, 32).
; PLAN: r0=370(x), r1=32(y), r2=84(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 32
LDI r2, 84
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
