; DESCRIPTION: Places a magenta 86x96 box at position (69, 153).
; PLAN: r0=69(x), r1=153(y), r2=86(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 153
LDI r2, 86
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
