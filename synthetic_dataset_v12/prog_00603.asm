; DESCRIPTION: Places a purple 60x85 rectangle at position (239, 18).
; PLAN: r0=239(x), r1=18(y), r2=60(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 18
LDI r2, 60
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
