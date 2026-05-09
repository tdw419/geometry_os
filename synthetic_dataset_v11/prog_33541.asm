; DESCRIPTION: Places a purple 82x27 rectangle at position (100, 211).
; PLAN: r0=100(x), r1=211(y), r2=82(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 211
LDI r2, 82
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
