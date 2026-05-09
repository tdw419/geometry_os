; DESCRIPTION: Places a magenta 58x108 rectangle at position (90, 4).
; PLAN: r0=90(x), r1=4(y), r2=58(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 4
LDI r2, 58
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
