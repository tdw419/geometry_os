; DESCRIPTION: Places a purple 27x29 box at position (53, 20).
; PLAN: r0=53(x), r1=20(y), r2=27(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 20
LDI r2, 27
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
