; DESCRIPTION: Places a purple 84x38 rectangle at position (32, 29).
; PLAN: r0=32(x), r1=29(y), r2=84(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 29
LDI r2, 84
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
