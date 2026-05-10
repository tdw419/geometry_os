; DESCRIPTION: Places a magenta 119x58 rectangle at position (209, 1).
; PLAN: r0=209(x), r1=1(y), r2=119(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 1
LDI r2, 119
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
