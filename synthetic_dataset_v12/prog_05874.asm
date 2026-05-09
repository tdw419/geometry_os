; DESCRIPTION: Places a magenta 29x92 rectangle at position (329, 72).
; PLAN: r0=329(x), r1=72(y), r2=29(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 72
LDI r2, 29
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
