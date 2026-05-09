; DESCRIPTION: Places a blue 68x95 rectangle at position (60, 88).
; PLAN: r0=60(x), r1=88(y), r2=68(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 88
LDI r2, 68
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
