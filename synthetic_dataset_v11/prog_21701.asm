; DESCRIPTION: Places a blue 49x44 rectangle at position (14, 17).
; PLAN: r0=14(x), r1=17(y), r2=49(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 17
LDI r2, 49
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
