; DESCRIPTION: Places a magenta 108x21 rectangle at position (23, 73).
; PLAN: r0=23(x), r1=73(y), r2=108(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 73
LDI r2, 108
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
