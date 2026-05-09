; DESCRIPTION: Places a magenta 63x23 rectangle at position (34, 148).
; PLAN: r0=34(x), r1=148(y), r2=63(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 148
LDI r2, 63
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
