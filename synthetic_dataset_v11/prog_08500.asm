; DESCRIPTION: Places a purple 93x64 rectangle at position (67, 24).
; PLAN: r0=67(x), r1=24(y), r2=93(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 24
LDI r2, 93
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
