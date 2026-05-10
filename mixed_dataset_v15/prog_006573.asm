; DESCRIPTION: Places a magenta 69x11 rectangle at position (122, 15).
; PLAN: r0=122(x), r1=15(y), r2=69(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 15
LDI r2, 69
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
