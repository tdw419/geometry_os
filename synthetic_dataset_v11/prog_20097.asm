; DESCRIPTION: Places a magenta 81x56 rectangle at position (122, 25).
; PLAN: r0=122(x), r1=25(y), r2=81(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 25
LDI r2, 81
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
