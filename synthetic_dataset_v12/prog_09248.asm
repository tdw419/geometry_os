; DESCRIPTION: Places a magenta 59x24 rectangle at position (1, 72).
; PLAN: r0=1(x), r1=72(y), r2=59(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 72
LDI r2, 59
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
