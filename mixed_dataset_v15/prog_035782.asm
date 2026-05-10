; DESCRIPTION: Places a magenta 55x12 box at position (101, 84).
; PLAN: r0=101(x), r1=84(y), r2=55(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 84
LDI r2, 55
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
