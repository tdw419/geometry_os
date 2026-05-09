; DESCRIPTION: Places a magenta 19x116 rectangle at position (31, 31).
; PLAN: r0=31(x), r1=31(y), r2=19(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 31
LDI r2, 19
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
