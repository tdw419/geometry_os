; DESCRIPTION: Places a blue 118x53 rectangle at position (387, 135).
; PLAN: r0=387(x), r1=135(y), r2=118(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 135
LDI r2, 118
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
