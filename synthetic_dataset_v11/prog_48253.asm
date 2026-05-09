; DESCRIPTION: Places a magenta 48x56 rectangle at position (147, 116).
; PLAN: r0=147(x), r1=116(y), r2=48(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 116
LDI r2, 48
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
