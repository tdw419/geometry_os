; DESCRIPTION: Places a blue 74x36 rectangle at position (85, 52).
; PLAN: r0=85(x), r1=52(y), r2=74(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 52
LDI r2, 74
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
