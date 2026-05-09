; DESCRIPTION: Places a purple 56x26 rectangle at position (108, 184).
; PLAN: r0=108(x), r1=184(y), r2=56(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 184
LDI r2, 56
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
