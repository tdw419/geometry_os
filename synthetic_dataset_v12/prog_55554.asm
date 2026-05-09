; DESCRIPTION: Places a purple 23x76 rectangle at position (184, 59).
; PLAN: r0=184(x), r1=59(y), r2=23(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 59
LDI r2, 23
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
