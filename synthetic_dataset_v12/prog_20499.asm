; DESCRIPTION: Places a magenta 64x17 rectangle at position (134, 222).
; PLAN: r0=134(x), r1=222(y), r2=64(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 222
LDI r2, 64
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
