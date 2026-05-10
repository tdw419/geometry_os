; DESCRIPTION: Places a blue 65x49 rectangle at position (108, 118).
; PLAN: r0=108(x), r1=118(y), r2=65(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 118
LDI r2, 65
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
