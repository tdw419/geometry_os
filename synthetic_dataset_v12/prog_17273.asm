; DESCRIPTION: Places a purple 113x73 rectangle at position (327, 103).
; PLAN: r0=327(x), r1=103(y), r2=113(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 103
LDI r2, 113
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
