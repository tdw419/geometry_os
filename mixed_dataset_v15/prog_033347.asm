; DESCRIPTION: Places a purple 44x21 rectangle at position (232, 19).
; PLAN: r0=232(x), r1=19(y), r2=44(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 19
LDI r2, 44
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
