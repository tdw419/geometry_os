; DESCRIPTION: Places a purple 43x71 rectangle at position (14, 63).
; PLAN: r0=14(x), r1=63(y), r2=43(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 63
LDI r2, 43
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
