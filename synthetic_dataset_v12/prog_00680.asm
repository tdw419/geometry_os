; DESCRIPTION: Places a magenta 56x14 rectangle at position (194, 184).
; PLAN: r0=194(x), r1=184(y), r2=56(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 184
LDI r2, 56
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
