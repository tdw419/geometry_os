; DESCRIPTION: Places a magenta 50x88 rectangle at position (399, 142).
; PLAN: r0=399(x), r1=142(y), r2=50(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 142
LDI r2, 50
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
