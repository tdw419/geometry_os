; DESCRIPTION: Places a magenta 45x58 rectangle at position (225, 189).
; PLAN: r0=225(x), r1=189(y), r2=45(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 189
LDI r2, 45
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
