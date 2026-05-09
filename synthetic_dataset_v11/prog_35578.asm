; DESCRIPTION: Places a purple 57x19 rectangle at position (20, 223).
; PLAN: r0=20(x), r1=223(y), r2=57(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 223
LDI r2, 57
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
