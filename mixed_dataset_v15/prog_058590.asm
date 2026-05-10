; DESCRIPTION: Places a blue 19x54 rectangle at position (43, 120).
; PLAN: r0=43(x), r1=120(y), r2=19(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 120
LDI r2, 19
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
