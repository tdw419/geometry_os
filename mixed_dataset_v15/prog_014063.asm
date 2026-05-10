; DESCRIPTION: Places a purple 31x70 rectangle at position (214, 101).
; PLAN: r0=214(x), r1=101(y), r2=31(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 101
LDI r2, 31
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
