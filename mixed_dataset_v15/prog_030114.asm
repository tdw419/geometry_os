; DESCRIPTION: Places a magenta 91x105 rectangle at position (409, 88).
; PLAN: r0=409(x), r1=88(y), r2=91(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 88
LDI r2, 91
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
