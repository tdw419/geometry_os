; DESCRIPTION: Places a blue 63x76 rectangle at position (133, 36).
; PLAN: r0=133(x), r1=36(y), r2=63(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 36
LDI r2, 63
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
