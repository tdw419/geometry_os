; DESCRIPTION: Places a purple 32x53 rectangle at position (12, 134).
; PLAN: r0=12(x), r1=134(y), r2=32(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 134
LDI r2, 32
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
