; DESCRIPTION: Places a purple 18x109 rectangle at position (49, 109).
; PLAN: r0=49(x), r1=109(y), r2=18(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 109
LDI r2, 18
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
