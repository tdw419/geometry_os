; DESCRIPTION: Places a magenta 53x13 rectangle at position (43, 138).
; PLAN: r0=43(x), r1=138(y), r2=53(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 138
LDI r2, 53
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
