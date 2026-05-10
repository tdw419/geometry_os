; DESCRIPTION: Places a magenta 64x17 rectangle at position (292, 123).
; PLAN: r0=292(x), r1=123(y), r2=64(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 123
LDI r2, 64
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
