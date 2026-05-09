; DESCRIPTION: Places a magenta 43x54 rectangle at position (8, 121).
; PLAN: r0=8(x), r1=121(y), r2=43(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 121
LDI r2, 43
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
