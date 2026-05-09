; DESCRIPTION: Places a blue 15x25 rectangle at position (225, 22).
; PLAN: r0=225(x), r1=22(y), r2=15(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 22
LDI r2, 15
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
