; DESCRIPTION: Places a magenta 88x84 rectangle at position (122, 143).
; PLAN: r0=122(x), r1=143(y), r2=88(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 143
LDI r2, 88
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
