; DESCRIPTION: Places a blue 52x44 rectangle at position (119, 198).
; PLAN: r0=119(x), r1=198(y), r2=52(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 198
LDI r2, 52
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
