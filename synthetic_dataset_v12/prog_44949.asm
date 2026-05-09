; DESCRIPTION: Places a magenta 84x14 rectangle at position (258, 156).
; PLAN: r0=258(x), r1=156(y), r2=84(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 156
LDI r2, 84
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
