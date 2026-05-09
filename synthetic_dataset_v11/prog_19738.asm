; DESCRIPTION: Places a blue 19x56 rectangle at position (76, 126).
; PLAN: r0=76(x), r1=126(y), r2=19(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 126
LDI r2, 19
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
