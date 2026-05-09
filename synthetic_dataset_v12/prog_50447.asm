; DESCRIPTION: Places a purple 38x96 rectangle at position (310, 8).
; PLAN: r0=310(x), r1=8(y), r2=38(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 8
LDI r2, 38
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
