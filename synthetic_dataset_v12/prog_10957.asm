; DESCRIPTION: Places a blue 46x13 rectangle at position (84, 124).
; PLAN: r0=84(x), r1=124(y), r2=46(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 124
LDI r2, 46
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
