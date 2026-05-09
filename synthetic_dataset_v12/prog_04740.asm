; DESCRIPTION: Places a magenta 12x68 rectangle at position (56, 72).
; PLAN: r0=56(x), r1=72(y), r2=12(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 72
LDI r2, 12
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
