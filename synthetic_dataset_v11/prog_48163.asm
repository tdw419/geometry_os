; DESCRIPTION: Places a blue 73x54 rectangle at position (19, 121).
; PLAN: r0=19(x), r1=121(y), r2=73(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 121
LDI r2, 73
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
