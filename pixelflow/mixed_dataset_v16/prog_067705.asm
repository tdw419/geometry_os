; DESCRIPTION: Places a blue 108x100 rectangle at position (2, 33).
; PLAN: r0=2(x), r1=33(y), r2=108(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 33
LDI r2, 108
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
