; DESCRIPTION: Places a blue 20x11 rectangle at position (469, 205).
; PLAN: r0=469(x), r1=205(y), r2=20(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 205
LDI r2, 20
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
