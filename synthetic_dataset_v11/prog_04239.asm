; DESCRIPTION: Places a blue 101x37 rectangle at position (39, 135).
; PLAN: r0=39(x), r1=135(y), r2=101(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 135
LDI r2, 101
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
