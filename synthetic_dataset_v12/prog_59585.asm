; DESCRIPTION: Places a purple 113x90 rectangle at position (223, 157).
; PLAN: r0=223(x), r1=157(y), r2=113(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 157
LDI r2, 113
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
