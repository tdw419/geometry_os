; DESCRIPTION: Places a purple 30x35 rectangle at position (119, 27).
; PLAN: r0=119(x), r1=27(y), r2=30(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 27
LDI r2, 30
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
