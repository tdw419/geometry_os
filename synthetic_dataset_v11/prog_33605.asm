; DESCRIPTION: Places a magenta 101x84 rectangle at position (39, 6).
; PLAN: r0=39(x), r1=6(y), r2=101(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 6
LDI r2, 101
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
