; DESCRIPTION: Places a magenta 88x33 rectangle at position (17, 15).
; PLAN: r0=17(x), r1=15(y), r2=88(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 15
LDI r2, 88
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
