; DESCRIPTION: Places a purple 64x13 rectangle at position (161, 125).
; PLAN: r0=161(x), r1=125(y), r2=64(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 125
LDI r2, 64
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
