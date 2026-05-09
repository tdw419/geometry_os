; DESCRIPTION: Places a magenta 24x113 rectangle at position (219, 69).
; PLAN: r0=219(x), r1=69(y), r2=24(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 69
LDI r2, 24
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
