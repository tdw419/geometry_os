; DESCRIPTION: Places a magenta 76x40 rectangle at position (134, 2).
; PLAN: r0=134(x), r1=2(y), r2=76(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 2
LDI r2, 76
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
