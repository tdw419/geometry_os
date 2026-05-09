; DESCRIPTION: Places a blue 11x26 rectangle at position (209, 94).
; PLAN: r0=209(x), r1=94(y), r2=11(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 94
LDI r2, 11
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
