; DESCRIPTION: Places a purple 85x15 rectangle at position (254, 134).
; PLAN: r0=254(x), r1=134(y), r2=85(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 134
LDI r2, 85
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
