; DESCRIPTION: Places a purple 55x58 rectangle at position (399, 45).
; PLAN: r0=399(x), r1=45(y), r2=55(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 45
LDI r2, 55
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
