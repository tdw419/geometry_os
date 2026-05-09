; DESCRIPTION: Places a magenta 74x22 rectangle at position (151, 178).
; PLAN: r0=151(x), r1=178(y), r2=74(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 178
LDI r2, 74
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
