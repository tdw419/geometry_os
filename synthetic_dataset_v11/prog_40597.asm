; DESCRIPTION: Places a magenta 58x46 rectangle at position (11, 133).
; PLAN: r0=11(x), r1=133(y), r2=58(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 133
LDI r2, 58
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
