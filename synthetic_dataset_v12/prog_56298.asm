; DESCRIPTION: Places a purple 82x15 rectangle at position (291, 61).
; PLAN: r0=291(x), r1=61(y), r2=82(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 61
LDI r2, 82
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
