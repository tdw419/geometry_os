; DESCRIPTION: Places a magenta 101x35 rectangle at position (115, 135).
; PLAN: r0=115(x), r1=135(y), r2=101(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 135
LDI r2, 101
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
