; DESCRIPTION: Places a blue 109x55 rectangle at position (396, 133).
; PLAN: r0=396(x), r1=133(y), r2=109(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 133
LDI r2, 109
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
