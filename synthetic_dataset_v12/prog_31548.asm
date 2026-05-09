; DESCRIPTION: Places a blue 108x105 rectangle at position (67, 17).
; PLAN: r0=67(x), r1=17(y), r2=108(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 17
LDI r2, 108
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
