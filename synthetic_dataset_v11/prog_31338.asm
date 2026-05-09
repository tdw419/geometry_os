; DESCRIPTION: Places a purple 28x53 rectangle at position (195, 129).
; PLAN: r0=195(x), r1=129(y), r2=28(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 129
LDI r2, 28
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
