; DESCRIPTION: Places a blue 82x15 rectangle at position (141, 88).
; PLAN: r0=141(x), r1=88(y), r2=82(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 88
LDI r2, 82
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
