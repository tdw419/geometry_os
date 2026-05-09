; DESCRIPTION: Places a blue 65x118 rectangle at position (222, 43).
; PLAN: r0=222(x), r1=43(y), r2=65(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 43
LDI r2, 65
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
