; DESCRIPTION: Places a magenta 56x92 rectangle at position (64, 24).
; PLAN: r0=64(x), r1=24(y), r2=56(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 24
LDI r2, 56
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
