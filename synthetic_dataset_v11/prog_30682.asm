; DESCRIPTION: Places a purple 109x12 rectangle at position (121, 29).
; PLAN: r0=121(x), r1=29(y), r2=109(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 29
LDI r2, 109
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
