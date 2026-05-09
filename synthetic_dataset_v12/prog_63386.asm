; DESCRIPTION: Places a yellow 108x14 rectangle at position (279, 110).
; PLAN: r0=279(x), r1=110(y), r2=108(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 110
LDI r2, 108
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
