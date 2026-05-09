; DESCRIPTION: Places a purple 76x59 rectangle at position (181, 133).
; PLAN: r0=181(x), r1=133(y), r2=76(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 133
LDI r2, 76
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
