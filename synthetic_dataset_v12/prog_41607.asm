; DESCRIPTION: Places a blue 73x103 rectangle at position (133, 129).
; PLAN: r0=133(x), r1=129(y), r2=73(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 129
LDI r2, 73
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
