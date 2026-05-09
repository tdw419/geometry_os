; DESCRIPTION: Places a magenta 59x119 rectangle at position (86, 87).
; PLAN: r0=86(x), r1=87(y), r2=59(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 87
LDI r2, 59
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
