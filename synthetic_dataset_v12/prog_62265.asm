; DESCRIPTION: Places a magenta 101x82 rectangle at position (72, 81).
; PLAN: r0=72(x), r1=81(y), r2=101(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 81
LDI r2, 101
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
