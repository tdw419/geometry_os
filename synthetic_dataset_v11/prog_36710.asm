; DESCRIPTION: Places a purple 15x19 rectangle at position (137, 195).
; PLAN: r0=137(x), r1=195(y), r2=15(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 195
LDI r2, 15
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
