; DESCRIPTION: Places a magenta 43x116 rectangle at position (69, 11).
; PLAN: r0=69(x), r1=11(y), r2=43(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 11
LDI r2, 43
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
