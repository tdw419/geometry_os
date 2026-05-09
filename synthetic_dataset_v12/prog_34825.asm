; DESCRIPTION: Places a magenta 95x100 rectangle at position (101, 2).
; PLAN: r0=101(x), r1=2(y), r2=95(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 2
LDI r2, 95
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
