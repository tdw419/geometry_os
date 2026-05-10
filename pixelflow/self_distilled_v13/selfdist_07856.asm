; DESCRIPTION: Places a purple 46x114 box at position (168, 148).
; PLAN: r0=168(x), r1=148(y), r2=46(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 148
LDI r2, 46
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
