; DESCRIPTION: Places a magenta 43x67 rectangle at position (194, 57).
; PLAN: r0=194(x), r1=57(y), r2=43(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 57
LDI r2, 43
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
