; DESCRIPTION: Places a purple 62x46 rectangle at position (161, 62).
; PLAN: r0=161(x), r1=62(y), r2=62(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 62
LDI r2, 62
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
