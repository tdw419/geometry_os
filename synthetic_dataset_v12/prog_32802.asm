; DESCRIPTION: Places a blue 63x33 rectangle at position (234, 35).
; PLAN: r0=234(x), r1=35(y), r2=63(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 35
LDI r2, 63
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
