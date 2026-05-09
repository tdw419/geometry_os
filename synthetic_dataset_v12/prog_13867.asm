; DESCRIPTION: Places a purple 77x32 rectangle at position (282, 214).
; PLAN: r0=282(x), r1=214(y), r2=77(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 214
LDI r2, 77
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
