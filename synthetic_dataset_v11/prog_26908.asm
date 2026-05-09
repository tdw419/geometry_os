; DESCRIPTION: Places a purple 120x13 rectangle at position (4, 18).
; PLAN: r0=4(x), r1=18(y), r2=120(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 18
LDI r2, 120
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
