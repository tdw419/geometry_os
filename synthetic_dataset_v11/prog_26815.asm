; DESCRIPTION: Places a purple 76x65 rectangle at position (123, 142).
; PLAN: r0=123(x), r1=142(y), r2=76(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 142
LDI r2, 76
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
