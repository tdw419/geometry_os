; DESCRIPTION: Places a purple 36x32 rectangle at position (424, 198).
; PLAN: r0=424(x), r1=198(y), r2=36(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 198
LDI r2, 36
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
