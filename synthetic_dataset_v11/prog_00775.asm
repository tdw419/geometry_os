; DESCRIPTION: Places a blue 74x49 rectangle at position (101, 83).
; PLAN: r0=101(x), r1=83(y), r2=74(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 83
LDI r2, 74
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
