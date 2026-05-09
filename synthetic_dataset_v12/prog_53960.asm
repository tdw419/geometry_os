; DESCRIPTION: Places a purple 12x49 rectangle at position (184, 152).
; PLAN: r0=184(x), r1=152(y), r2=12(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 152
LDI r2, 12
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
