; DESCRIPTION: Places a blue 105x55 rectangle at position (175, 144).
; PLAN: r0=175(x), r1=144(y), r2=105(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 144
LDI r2, 105
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
