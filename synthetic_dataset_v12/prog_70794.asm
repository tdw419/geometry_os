; DESCRIPTION: Places a magenta 15x11 rectangle at position (427, 224).
; PLAN: r0=427(x), r1=224(y), r2=15(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 224
LDI r2, 15
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
