; DESCRIPTION: Places a purple 86x39 rectangle at position (217, 137).
; PLAN: r0=217(x), r1=137(y), r2=86(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 137
LDI r2, 86
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
