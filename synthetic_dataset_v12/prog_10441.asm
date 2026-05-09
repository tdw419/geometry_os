; DESCRIPTION: Places a magenta 84x107 rectangle at position (324, 14).
; PLAN: r0=324(x), r1=14(y), r2=84(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 14
LDI r2, 84
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
