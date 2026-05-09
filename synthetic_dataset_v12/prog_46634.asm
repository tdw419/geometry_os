; DESCRIPTION: Places a white 60x88 rectangle at position (442, 118).
; PLAN: r0=442(x), r1=118(y), r2=60(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 118
LDI r2, 60
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
