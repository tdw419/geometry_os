; DESCRIPTION: Places a purple 49x33 rectangle at position (327, 196).
; PLAN: r0=327(x), r1=196(y), r2=49(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 196
LDI r2, 49
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
