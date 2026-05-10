; DESCRIPTION: Places a blue 86x17 rectangle at position (16, 175).
; PLAN: r0=16(x), r1=175(y), r2=86(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 175
LDI r2, 86
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
