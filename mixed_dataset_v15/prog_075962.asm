; DESCRIPTION: Places a blue 33x22 rectangle at position (318, 18).
; PLAN: r0=318(x), r1=18(y), r2=33(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 18
LDI r2, 33
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
