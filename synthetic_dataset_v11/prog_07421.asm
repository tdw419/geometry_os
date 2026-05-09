; DESCRIPTION: Places a blue 14x58 rectangle at position (230, 17).
; PLAN: r0=230(x), r1=17(y), r2=14(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 17
LDI r2, 14
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
