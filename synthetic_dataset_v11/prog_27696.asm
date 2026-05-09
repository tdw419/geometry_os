; DESCRIPTION: Places a blue 17x25 rectangle at position (149, 62).
; PLAN: r0=149(x), r1=62(y), r2=17(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 62
LDI r2, 17
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
