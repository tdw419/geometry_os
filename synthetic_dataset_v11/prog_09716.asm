; DESCRIPTION: Places a magenta 17x88 rectangle at position (43, 5).
; PLAN: r0=43(x), r1=5(y), r2=17(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 5
LDI r2, 17
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
