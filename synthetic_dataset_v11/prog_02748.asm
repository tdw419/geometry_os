; DESCRIPTION: Places a magenta 10x84 rectangle at position (59, 104).
; PLAN: r0=59(x), r1=104(y), r2=10(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 104
LDI r2, 10
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
