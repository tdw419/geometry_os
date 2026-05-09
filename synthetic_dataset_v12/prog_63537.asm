; DESCRIPTION: Places a purple 93x16 rectangle at position (310, 103).
; PLAN: r0=310(x), r1=103(y), r2=93(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 103
LDI r2, 93
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
