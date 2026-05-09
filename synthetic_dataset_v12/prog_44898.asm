; DESCRIPTION: Places a magenta 32x59 rectangle at position (181, 5).
; PLAN: r0=181(x), r1=5(y), r2=32(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 5
LDI r2, 32
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
