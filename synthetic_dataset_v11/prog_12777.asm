; DESCRIPTION: Places a purple 18x19 rectangle at position (172, 60).
; PLAN: r0=172(x), r1=60(y), r2=18(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 60
LDI r2, 18
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
