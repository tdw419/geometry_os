; DESCRIPTION: Places a magenta 88x100 rectangle at position (151, 95).
; PLAN: r0=151(x), r1=95(y), r2=88(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 95
LDI r2, 88
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
