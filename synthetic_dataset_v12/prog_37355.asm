; DESCRIPTION: Places a magenta 96x30 rectangle at position (354, 22).
; PLAN: r0=354(x), r1=22(y), r2=96(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 22
LDI r2, 96
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
