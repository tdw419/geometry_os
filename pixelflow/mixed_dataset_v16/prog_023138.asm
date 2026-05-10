; DESCRIPTION: Places a blue 33x33 rectangle at position (227, 101).
; PLAN: r0=227(x), r1=101(y), r2=33(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 101
LDI r2, 33
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
