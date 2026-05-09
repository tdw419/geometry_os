; DESCRIPTION: Places a blue 58x103 rectangle at position (196, 31).
; PLAN: r0=196(x), r1=31(y), r2=58(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 31
LDI r2, 58
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
