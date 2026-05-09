; DESCRIPTION: Places a magenta 58x58 rectangle at position (16, 55).
; PLAN: r0=16(x), r1=55(y), r2=58(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 55
LDI r2, 58
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
