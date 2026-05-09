; DESCRIPTION: Places a magenta 13x101 rectangle at position (95, 28).
; PLAN: r0=95(x), r1=28(y), r2=13(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 28
LDI r2, 13
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
