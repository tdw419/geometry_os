; DESCRIPTION: Places a purple 31x19 rectangle at position (45, 112).
; PLAN: r0=45(x), r1=112(y), r2=31(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 112
LDI r2, 31
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
