; DESCRIPTION: Places a purple 13x49 rectangle at position (392, 73).
; PLAN: r0=392(x), r1=73(y), r2=13(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 73
LDI r2, 13
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
