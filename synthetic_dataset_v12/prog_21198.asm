; DESCRIPTION: Places a blue 88x74 rectangle at position (164, 126).
; PLAN: r0=164(x), r1=126(y), r2=88(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 126
LDI r2, 88
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
