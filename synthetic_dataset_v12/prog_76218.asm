; DESCRIPTION: Places a purple 45x44 rectangle at position (366, 182).
; PLAN: r0=366(x), r1=182(y), r2=45(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 182
LDI r2, 45
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
