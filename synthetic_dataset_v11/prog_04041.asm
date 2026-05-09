; DESCRIPTION: Places a magenta 55x74 rectangle at position (94, 121).
; PLAN: r0=94(x), r1=121(y), r2=55(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 121
LDI r2, 55
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
