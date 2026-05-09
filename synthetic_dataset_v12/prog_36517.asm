; DESCRIPTION: Places a blue 103x78 rectangle at position (337, 88).
; PLAN: r0=337(x), r1=88(y), r2=103(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 88
LDI r2, 103
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
