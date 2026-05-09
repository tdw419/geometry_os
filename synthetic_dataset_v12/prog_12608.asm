; DESCRIPTION: Places a magenta 43x101 rectangle at position (5, 28).
; PLAN: r0=5(x), r1=28(y), r2=43(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 28
LDI r2, 43
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
