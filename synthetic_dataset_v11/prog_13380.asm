; DESCRIPTION: Places a purple 62x22 rectangle at position (172, 161).
; PLAN: r0=172(x), r1=161(y), r2=62(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 161
LDI r2, 62
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
