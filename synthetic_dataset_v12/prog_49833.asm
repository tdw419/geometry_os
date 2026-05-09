; DESCRIPTION: Places a purple 40x80 rectangle at position (48, 122).
; PLAN: r0=48(x), r1=122(y), r2=40(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 122
LDI r2, 40
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
