; DESCRIPTION: Places a blue 49x108 rectangle at position (154, 19).
; PLAN: r0=154(x), r1=19(y), r2=49(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 19
LDI r2, 49
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
