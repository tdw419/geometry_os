; DESCRIPTION: Places a magenta 81x17 rectangle at position (121, 64).
; PLAN: r0=121(x), r1=64(y), r2=81(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 64
LDI r2, 81
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
