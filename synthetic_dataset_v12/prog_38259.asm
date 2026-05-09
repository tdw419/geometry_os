; DESCRIPTION: Places a purple 42x33 rectangle at position (421, 219).
; PLAN: r0=421(x), r1=219(y), r2=42(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 219
LDI r2, 42
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
