; DESCRIPTION: Places a purple 46x53 rectangle at position (136, 156).
; PLAN: r0=136(x), r1=156(y), r2=46(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 156
LDI r2, 46
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
