; DESCRIPTION: Places a purple 79x35 rectangle at position (28, 175).
; PLAN: r0=28(x), r1=175(y), r2=79(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 175
LDI r2, 79
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
