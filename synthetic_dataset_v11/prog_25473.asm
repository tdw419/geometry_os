; DESCRIPTION: Places a purple 113x32 rectangle at position (107, 100).
; PLAN: r0=107(x), r1=100(y), r2=113(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 100
LDI r2, 113
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
