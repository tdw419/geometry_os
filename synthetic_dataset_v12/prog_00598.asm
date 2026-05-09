; DESCRIPTION: Places a blue 43x26 rectangle at position (442, 205).
; PLAN: r0=442(x), r1=205(y), r2=43(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 205
LDI r2, 43
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
