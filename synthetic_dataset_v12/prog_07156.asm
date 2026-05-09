; DESCRIPTION: Places a purple 85x31 rectangle at position (129, 70).
; PLAN: r0=129(x), r1=70(y), r2=85(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 70
LDI r2, 85
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
