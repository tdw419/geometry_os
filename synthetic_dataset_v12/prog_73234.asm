; DESCRIPTION: Places a magenta 74x32 rectangle at position (324, 129).
; PLAN: r0=324(x), r1=129(y), r2=74(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 129
LDI r2, 74
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
