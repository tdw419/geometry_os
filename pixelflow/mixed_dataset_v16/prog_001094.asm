; DESCRIPTION: Places a magenta 108x108 rectangle at position (59, 127).
; PLAN: r0=59(x), r1=127(y), r2=108(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 127
LDI r2, 108
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
