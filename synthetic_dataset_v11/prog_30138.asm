; DESCRIPTION: Places a purple 76x11 rectangle at position (45, 232).
; PLAN: r0=45(x), r1=232(y), r2=76(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 232
LDI r2, 76
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
