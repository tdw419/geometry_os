; DESCRIPTION: Places a blue 99x78 rectangle at position (157, 116).
; PLAN: r0=157(x), r1=116(y), r2=99(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 116
LDI r2, 99
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
