; DESCRIPTION: Places a purple 55x112 rectangle at position (120, 63).
; PLAN: r0=120(x), r1=63(y), r2=55(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 63
LDI r2, 55
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
