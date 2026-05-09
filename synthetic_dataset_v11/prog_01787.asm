; DESCRIPTION: Places a magenta 68x36 rectangle at position (4, 149).
; PLAN: r0=4(x), r1=149(y), r2=68(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 149
LDI r2, 68
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
