; DESCRIPTION: Places a magenta 108x54 rectangle at position (116, 10).
; PLAN: r0=116(x), r1=10(y), r2=108(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 10
LDI r2, 108
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
