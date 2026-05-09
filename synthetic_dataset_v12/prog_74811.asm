; DESCRIPTION: Places a magenta 10x108 rectangle at position (183, 16).
; PLAN: r0=183(x), r1=16(y), r2=10(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 16
LDI r2, 10
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
