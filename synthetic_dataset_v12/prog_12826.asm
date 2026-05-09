; DESCRIPTION: Places a magenta 100x26 rectangle at position (302, 48).
; PLAN: r0=302(x), r1=48(y), r2=100(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 48
LDI r2, 100
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
