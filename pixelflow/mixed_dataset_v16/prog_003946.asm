; DESCRIPTION: Places a magenta 21x114 rectangle at position (72, 17).
; PLAN: r0=72(x), r1=17(y), r2=21(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 17
LDI r2, 21
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
