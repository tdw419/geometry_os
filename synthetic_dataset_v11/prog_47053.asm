; DESCRIPTION: Places a magenta 33x108 rectangle at position (40, 5).
; PLAN: r0=40(x), r1=5(y), r2=33(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 5
LDI r2, 33
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
