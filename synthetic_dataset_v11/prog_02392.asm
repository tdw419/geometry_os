; DESCRIPTION: Places a purple 46x100 rectangle at position (81, 49).
; PLAN: r0=81(x), r1=49(y), r2=46(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 49
LDI r2, 46
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
