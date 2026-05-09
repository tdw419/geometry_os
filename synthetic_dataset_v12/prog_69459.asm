; DESCRIPTION: Places a blue 108x103 rectangle at position (227, 140).
; PLAN: r0=227(x), r1=140(y), r2=108(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 140
LDI r2, 108
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
