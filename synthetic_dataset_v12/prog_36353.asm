; DESCRIPTION: Places a purple 64x63 rectangle at position (409, 92).
; PLAN: r0=409(x), r1=92(y), r2=64(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 92
LDI r2, 64
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
