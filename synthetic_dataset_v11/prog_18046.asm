; DESCRIPTION: Places a blue 100x87 rectangle at position (39, 69).
; PLAN: r0=39(x), r1=69(y), r2=100(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 69
LDI r2, 100
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
