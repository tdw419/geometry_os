; DESCRIPTION: Places a magenta 15x101 rectangle at position (34, 27).
; PLAN: r0=34(x), r1=27(y), r2=15(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 27
LDI r2, 15
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
