; DESCRIPTION: Places a blue 66x103 rectangle at position (148, 11).
; PLAN: r0=148(x), r1=11(y), r2=66(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 11
LDI r2, 66
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
